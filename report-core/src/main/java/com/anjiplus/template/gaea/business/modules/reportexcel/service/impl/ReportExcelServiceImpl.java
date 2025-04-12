package com.anjiplus.template.gaea.business.modules.reportexcel.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.anji.plus.gaea.constant.BaseOperationEnum;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.exception.BusinessException;
import com.anji.plus.gaea.exception.BusinessExceptionBuilder;
import com.anji.plus.gaea.utils.GaeaAssert;
import com.anji.plus.gaea.utils.GaeaBeanUtils;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.anjiplus.template.gaea.business.enums.ExportTypeEnum;
import com.anjiplus.template.gaea.business.modules.dataset.controller.dto.DataSetDto;
import com.anjiplus.template.gaea.business.modules.dataset.controller.dto.OriginalDataDto;
import com.anjiplus.template.gaea.business.modules.dataset.service.DataSetService;
import com.anjiplus.template.gaea.business.modules.file.service.GaeaFileService;
import com.anjiplus.template.gaea.business.modules.file.util.FileUtils;
import com.anjiplus.template.gaea.business.modules.report.dao.ReportMapper;
import com.anjiplus.template.gaea.business.modules.report.dao.entity.Report;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto.ReportExcelDto;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto.ReportExcelStyleDto;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.ReportExcelMapper;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.entity.ReportExcel;
import com.anjiplus.template.gaea.business.modules.reportexcel.service.ReportExcelService;
import com.anjiplus.template.gaea.business.modules.reportexcel.util.CellType;
import com.anjiplus.template.gaea.business.modules.reportexcel.util.XlsUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.openxml4j.util.ZipSecureFile;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.*;
import java.util.stream.Collectors;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/4/13 15:14
 */
@Service
public class ReportExcelServiceImpl implements ReportExcelService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ReportExcelMapper reportExcelMapper;

    @Autowired
    private DataSetService dataSetService;

    @Autowired
    private GaeaFileService gaeaFileService;


    @Autowired
    private ReportMapper reportMapper;

    @Value("${customer.file.tmp-path:.}")
    private String dictPath;

    private final static String ZIP_PATH = "/tmp_zip/";


    @Override
    public GaeaBaseMapper<ReportExcel> getMapper() {
        return reportExcelMapper;
    }

    @Override
    public ReportExcelDto detailByReportCode(String reportCode) {
        QueryWrapper<ReportExcel> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("report_code", reportCode);
        ReportExcel reportExcel = reportExcelMapper.selectOne(queryWrapper);
        if (reportExcel != null) {
            ReportExcelDto dto = new ReportExcelDto();
            BeanUtils.copyProperties(reportExcel, dto);
            return dto;
        }
        return null;
    }

    /**
     * 操作前处理
     *
     * @param entity        前端传递的对象
     * @param operationEnum 操作类型
     * @throws BusinessException 阻止程序继续执行或回滚事务
     */
    @Override
    public void processBeforeOperation(ReportExcel entity, BaseOperationEnum operationEnum) throws BusinessException {
        if (operationEnum.equals(BaseOperationEnum.INSERT)) {
            String reportCode = entity.getReportCode();
            ReportExcel report = this.selectOne("report_code", reportCode);
            if (null != report) {
                this.deleteById(report.getId());
            }
        }
    }

    /**
     * 报表预览
     */
    @Override
    public ReportExcelDto preview(ReportExcelDto reportExcelDto) {
        // 根据id查询 报表详情
        ReportExcel reportExcel = selectOne("report_code", reportExcelDto.getReportCode());
        QueryWrapper<Report> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("report_code", reportExcelDto.getReportCode());
        Report report = reportMapper.selectOne(queryWrapper);
        GaeaAssert.notNull(reportExcel, ResponseCode.RULE_CONTENT_NOT_EXIST, "reportExcel");
        String setParam = reportExcelDto.getSetParam();

        GaeaBeanUtils.copyAndFormatter(reportExcel, reportExcelDto);
        if (StringUtils.isNotBlank(setParam)) {
            reportExcelDto.setSetParam(setParam);
        }
        reportExcelDto.setReportName(report.getReportName());
        // 数据集解析
        String jsonStr = analysisReportData(reportExcelDto);
        reportExcelDto.setJsonStr(jsonStr);
//        reportExcelDto.setTotal(jsonObject.getJSONObject("rows").size());
        return reportExcelDto;
    }

    /**
     * Excel导出
     *
     * @param request
     * @param response
     * @param reportExcelDto
     * @return
     * @throws IOException
     */
    @Override
    public ResponseEntity<byte[]> exportExcel(HttpServletRequest request, HttpServletResponse response, ReportExcelDto reportExcelDto) throws IOException {
        String userAgent = request.getHeader("User-Agent");
        boolean isIeBrowser = userAgent.indexOf("MSIE") > 0;

        String reportCode = reportExcelDto.getReportCode();
        String exportType = reportExcelDto.getExportType();
        List<List<ReportExcelStyleDto>> reportExcelStyleList = new ArrayList<>();
        JSONObject rowData = JSON.parseObject(reportExcelDto.getRowDatas());
        // 将JSONObject对象转换为列表
        List<Integer> dataNumList = rowData.keySet().stream().map(Integer::parseInt).sorted().collect(Collectors.toList());
        for (Integer i : dataNumList) {
            JSONArray jsonArray = rowData.getJSONArray(i.toString());
            List<ReportExcelStyleDto> reportExcelStyleDtos = jsonArray.toJavaList(ReportExcelStyleDto.class);
            reportExcelStyleList.add(reportExcelStyleDtos);
        }
        ReportExcelDto report = detailByReportCode(reportCode);
        reportExcelDto.setJsonStr(report.getJsonStr());
        String jsonStr = analysisReportData(reportExcelDto);
        List<JSONObject> lists = (List<JSONObject>) JSON.parse(jsonStr);
        OutputStream out = null;
        File file = null;
        File pdfFile = null;

        String fileExtName = ".xlsx";
        String fileName = report.getReportCode();
        File dir = new File(dictPath + ZIP_PATH);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String filePath = dir.getAbsolutePath() + File.separator + fileName + ".xlsx";
        file = new File(filePath);
        out = Files.newOutputStream(Paths.get(filePath));

        XlsUtil.exportXlsFile(out, true, lists);
        ResponseEntity.BodyBuilder builder = ResponseEntity.ok();
        //application/octet-stream 二进制数据流（最常见的文件下载）
        builder.contentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity<byte[]> body = null;
        //
        if (exportType.equals(ExportTypeEnum.GAEA_TEMPLATE_EXCEL.getCodeValue())) {
            if (isIeBrowser) {
                builder.header("Content-Disposition", "attachment; filename=" + reportCode + fileExtName);
            } else {
                builder.header("Content-Disposition", "attacher; filename*=UTF-8''" + reportCode + fileExtName);
            }
            builder.contentLength(file.length());
            body = builder.body(FileUtils.readFileToByteArray(file));
        } else if (exportType.equals(ExportTypeEnum.GAEA_TEMPLATE_PDF.getCodeValue())) {
            // 将Excel文件转换为PDF
            fileExtName = ".pdf";
            if (isIeBrowser) {
                builder.header("Content-Disposition", "attachment; filename=" + reportCode + fileExtName);
            } else {
                builder.header("Content-Disposition", "attacher; filename*=UTF-8''" + reportCode + fileExtName);
            }
            String pdfFileName = fileName + fileExtName;
            String pdfFilePath = dir.getAbsolutePath() + File.separator + pdfFileName;
            pdfFile = convertExcelToPdf(filePath, pdfFilePath, reportExcelStyleList);

            builder.contentLength(pdfFile.length());
            body= builder.body(FileUtils.readFileToByteArray(pdfFile));
        }else{
            logger.error("不支持的文件后缀");
            throw new BusinessException(ResponseCode.FILE_SUFFIX_UNSUPPORTED);
        }
        return body;
    }

    /**
     * 抽取导出Excel核心逻辑
     */
    public void exportExcelCore(ReportExcelDto reportExcelDto) {
        String reportCode = reportExcelDto.getReportCode();
        String exportType = reportExcelDto.getExportType();
        List<List<ReportExcelStyleDto>> reportExcelStyleList = new ArrayList<>();
        JSONObject rowData = JSON.parseObject(reportExcelDto.getRowDatas());
        // 将JSONObject对象转换为列表
        List<Integer> dataNumList = rowData.keySet().stream().map(Integer::parseInt).sorted().collect(Collectors.toList());
        for (Integer i : dataNumList) {
            JSONArray jsonArray = rowData.getJSONArray(i.toString());
            List<ReportExcelStyleDto> reportExcelStyleDtos = jsonArray.toJavaList(ReportExcelStyleDto.class);
            reportExcelStyleList.add(reportExcelStyleDtos);
        }
        ReportExcelDto report = detailByReportCode(reportCode);
        reportExcelDto.setJsonStr(report.getJsonStr());
        String jsonStr = analysisReportData(reportExcelDto);
        List<JSONObject> lists = (List<JSONObject>) JSON.parse(jsonStr);
        OutputStream out = null;
        File file = null;
        File pdfFile = null;
        try {
            String fileName = report.getReportCode();
            File dir = new File(dictPath + ZIP_PATH);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String filePath = dir.getAbsolutePath() + File.separator + fileName + ".xlsx";
            file = new File(filePath);
            out = Files.newOutputStream(Paths.get(filePath));
            XlsUtil.exportXlsFile(out, true, lists);
            if (exportType.equals(ExportTypeEnum.GAEA_TEMPLATE_EXCEL.getCodeValue())) {
                gaeaFileService.upload(file);
            } else if (exportType.equals(ExportTypeEnum.GAEA_TEMPLATE_PDF.getCodeValue())) {
                // 将Excel文件转换为PDF
                String pdfFileName = fileName + ".pdf";
                String pdfFilePath = dir.getAbsolutePath() + File.separator + pdfFileName;
                pdfFile = convertExcelToPdf(filePath, pdfFilePath, reportExcelStyleList);
                gaeaFileService.upload(pdfFile);
            }

        } catch (IOException e) {
            logger.error("导出失败", e);
        } finally {
            try {
                out.close();
                file.delete();
                if (!Objects.isNull(pdfFile)) {
                    pdfFile.delete();
                }
            } catch (IOException e) {
                throw BusinessExceptionBuilder.build(ResponseCode.FILE_OPERATION_FAILED, e.getMessage());
            }

        }
    }

    // 将Excel文件转换为PDF
    public File convertExcelToPdf(String excelFilePath, String pdfFilePath, List<List<ReportExcelStyleDto>> reportExcelStyleList) {
        try {
            //  解决excel转换为pdf zipboom问题
            ZipSecureFile.setMinInflateRatio(0);
            // 读取Excel文件
            Workbook workbook = new XSSFWorkbook(excelFilePath);
            Sheet sheet = workbook.getSheetAt(0);

            // 创建PDF文档
            Document document = new Document(PageSize.A4);
            PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfFilePath));
            document.open();

            // 创建PDF表格
            PdfPTable table = new PdfPTable(sheet.getRow(0).getLastCellNum());
            table.setWidthPercentage(100);

            // 设置中文字体
            BaseFont baseFont = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

            // 设置表头
            Row headerRow = sheet.getRow(0);
            for (int i = 0; i < headerRow.getLastCellNum(); i++) {
                Cell headerCell = headerRow.getCell(i);

                // 获取单元格样式
                PdfPCell tableCell = new PdfPCell();
                //tableCell.setPhrase(new Phrase(getStringValue(headerCell), font));
                ReportExcelStyleDto reportExcelStyleDto = reportExcelStyleList.get(0).get(i);
                if (!Objects.isNull(reportExcelStyleDto)) {
                    processCellStyle(reportExcelStyleDto, tableCell, headerCell, baseFont);
                }
                table.addCell(tableCell);
            }

            // 遍历Excel表格的行和列
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                if (row == null) {
                    // 如果行为空，创建一个空的行并添加到PDF表格中
                    row = sheet.createRow(i);
                }
                for (int j = 0; j < headerRow.getLastCellNum(); j++) {
                    Cell cell = row.getCell(j, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    if (cell.getCellType() == org.apache.poi.ss.usermodel.CellType.BLANK) {
                        cell.setCellValue(" ");
                    }
                    PdfPCell tableCell = new PdfPCell();
                    //tableCell.setPhrase(new Phrase(getStringValue(cell), font));
                    ReportExcelStyleDto reportExcelStyleDto = reportExcelStyleList.get(i).get(j);
                    if (!Objects.isNull(reportExcelStyleDto)) {
                        processCellStyle(reportExcelStyleDto, tableCell, cell, baseFont);
                    }
                    table.addCell(tableCell);
                }
            }

            // 将表格添加到PDF文档中
            document.add(table);

            document.close();
            workbook.close();

            System.out.println("Excel转换为PDF成功！");

            return new File(pdfFilePath);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (com.itextpdf.text.DocumentException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 处理导出pdf文件样式
     *
     * @param tableCell
     */
    public void processCellStyle(ReportExcelStyleDto reportExcelStyleDto, PdfPCell tableCell, Cell cell, BaseFont baseFont) {
        // 处理单元格背景颜色
        String bg = reportExcelStyleDto.getBg();
        java.awt.Color color = null;
        if (!Objects.isNull(bg)) {
            color = parseRGB(bg);
            if(color != null){
                tableCell.setBackgroundColor(new BaseColor(color.getRed(), color.getGreen(), color.getBlue()));
            }
        }
        // 处理字体
        String fc = reportExcelStyleDto.getFc();
        Integer fs = reportExcelStyleDto.getFs();
        String ff = reportExcelStyleDto.getFf();
        Boolean bl = reportExcelStyleDto.isBl();
        Boolean it = reportExcelStyleDto.isIt();
        Boolean cl = reportExcelStyleDto.isCl();
        Integer ht = reportExcelStyleDto.getHt();
        Integer vt = reportExcelStyleDto.getVt();

        //循环外会导致所有单元格共用一个font
        Font font = new Font(baseFont, 10, Font.NORMAL);

        // 设置字体颜色
        if (!Objects.isNull(fc)) {
            color = parseRGB(fc);
            if(color != null){
                font.setColor(new BaseColor(color.getRed(), color.getGreen(), color.getBlue()));
            }
        }
        // 设置字体
        if (!Objects.isNull(ff) && !Objects.equals("0", ff)) {
            font.setFamily(ff.toString());
        }
        // 设置字体大小
        if (!Objects.isNull(fs) && !Objects.equals(0, fs)) {
            font.setSize(fs);
        }
        // 设置字体加粗
        if (Objects.equals(Boolean.TRUE, bl)) {
            font.setStyle(Font.BOLD);
        }
        // 设置字体斜体
        if (Objects.equals(Boolean.TRUE, it)) {
            font.setStyle(Font.ITALIC);
        }
        // 设置字体加粗且斜体
        if (Objects.equals(Boolean.TRUE, bl) && Objects.equals(Boolean.TRUE, it)) {
            font.setStyle(Font.BOLDITALIC);
        }
        // 是否删除线
        if (Objects.equals(Boolean.TRUE, cl)) {
            // 如果是粗体且斜体
            if (font.getStyle() == Font.BOLDITALIC) {
                font.setStyle(Font.BOLDITALIC | Font.STRIKETHRU);
            }
            // 如果是粗体
            else if (font.getStyle() == Font.BOLD) {
                font.setStyle(Font.BOLD | Font.STRIKETHRU);
            }
            // 如果是斜体
            else if (font.getStyle() == Font.ITALIC) {
                font.setStyle(Font.ITALIC | Font.STRIKETHRU);
            } else {
                font.setStyle(Font.STRIKETHRU);
            }
        }
        // 水平对齐
        if (!Objects.isNull(ht)) {
            if (Objects.equals(ht, 0)) {
                tableCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            } else if (Objects.equals(ht, 1)) {
                tableCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            } else if (Objects.equals(ht, 2)) {
                tableCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            }
        }
        // 垂直对齐
        if (!Objects.isNull(vt)) {
            if (Objects.equals(ht, 0)) {
                tableCell.setVerticalAlignment(com.itextpdf.text.Element.ALIGN_MIDDLE);
            } else if (Objects.equals(ht, 1)) {
                tableCell.setVerticalAlignment(Element.ALIGN_TOP);
            } else if (Objects.equals(ht, 2)) {
                tableCell.setVerticalAlignment(Element.ALIGN_BOTTOM);
            }
        }
        tableCell.setPhrase(new Phrase(getStringValue(cell), font));
        Phrase phrase = tableCell.getPhrase();
        tableCell.setPhrase(new Paragraph(phrase.getContent(), font));
        //处理字体
        tableCell.setBorderColor(BaseColor.BLACK);

    }

    public static java.awt.Color parseRGB(String rgb) {
        try {
            if (rgb.startsWith("#")) {
                // 处理 #ffffff 格式
                String hex = rgb.substring(1);
                int red = Integer.parseInt(hex.substring(0, 2), 16);
                int green = Integer.parseInt(hex.substring(2, 4), 16);
                int blue = Integer.parseInt(hex.substring(4, 6), 16);
                return new java.awt.Color(red, green, blue);
            }else if (rgb.startsWith("(") || rgb.startsWith("rgb(")) {
                String[] components = rgb.substring(rgb.indexOf("(") + 1, rgb.indexOf(")")).split(",");
                int red = Integer.parseInt(components[0].trim());
                int green = Integer.parseInt(components[1].trim());
                int blue = Integer.parseInt(components[2].trim());

                return new java.awt.Color(red, green, blue);
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 解析失败，返回null
        }
    }

    private String getStringValue(Cell cell) {
        if (cell == null) {
            return "";
        } else {
            return cell.toString();
        }
    }

    /**
     * 解析报表数据，动态插入列表数据和对象数据
     */
    private String analysisReportData(ReportExcelDto reportExcelDto) {

        String jsonStr = reportExcelDto.getJsonStr();
        String setParam = reportExcelDto.getSetParam();
        List<JSONObject> dbObjectList = (List<JSONObject>) JSON.parse(jsonStr);

        if (dbObjectList != null && !dbObjectList.isEmpty()) {
            //数据集数据缓存
            Map<String, OriginalDataDto> setMap = new HashMap<>();
            for (int x = 0; x < dbObjectList.size(); x++) {
                analysisSheetCellData(dbObjectList.get(x), setParam, setMap);
            }
        }
        //fastjson $ref 循环引用
        return JSONObject.toJSONString(dbObjectList, SerializerFeature.DisableCircularReferenceDetect);
    }

    /**
     * 解析单sheet data
     *
     * @param dbObject
     */
    private void analysisSheet(JSONObject dbObject, String setParma) {
        //data是一个二维数组
        if (dbObject.containsKey("data") && null != dbObject.get("data")) {
            List<JSONArray> data = (List<JSONArray>) dbObject.get("data");


            //行
            for (int r = 0; r < data.size(); r++) {
                JSONArray jsonArray = data.get(r);
                //列
                for (int c = 0; c < jsonArray.size(); c++) {
                    //单元格
                    JSONObject cell = jsonArray.getJSONObject(c);
                    if (null != cell && cell.containsKey("v") && StringUtils.isNotBlank(cell.getString("v"))) {
                        String v = cell.getString("v");
                        DataSetDto dataSet = getDataSet(v, setParma);
                        if (null != dataSet) {
                            OriginalDataDto originalDataDto = dataSetService.getData(dataSet);
                            if (null != originalDataDto.getData()) {
                                if (originalDataDto.getData().size() == 1) {
                                    //对象
                                    JSONObject jsonObject = originalDataDto.getData().get(0);
                                    String fieldLabel = jsonObject.getString(dataSet.getFieldLabel());

                                    String replace = v.replace("#{".concat(dataSet.getSetCode()).concat(".").concat(dataSet.getFieldLabel()).concat("}"), fieldLabel);
                                    dbObject.getJSONArray("data").getJSONArray(r).getJSONObject(c).put("v", replace);
                                    dbObject.getJSONArray("data").getJSONArray(r).getJSONObject(c).put("m", replace);

                                } else {
                                    //集合
                                    JSONObject jsonObject = originalDataDto.getData().get(0);
                                    String fieldLabel = jsonObject.getString(dataSet.getFieldLabel());

                                    String replace = v.replace("#{".concat(dataSet.getSetCode()).concat(".").concat(dataSet.getFieldLabel()).concat("}"), fieldLabel);
                                    dbObject.getJSONArray("data").getJSONArray(r).getJSONObject(c).put("v", replace);
                                    dbObject.getJSONArray("data").getJSONArray(r).getJSONObject(c).put("m", replace);
                                }
                            }

                        }
                    }


                }
            }


            System.out.println("aaaa");


        }


    }

    /**
     * 解析单sheet celldata
     *
     * @param dbObject
     */
    private void analysisSheetCellData(JSONObject dbObject, String setParam, Map<String, OriginalDataDto> setMap) {
        //清空data值
        dbObject.remove("data");
        //celldata是一个一维数组
        if (dbObject.containsKey("celldata") && null != dbObject.get("celldata")) {
            List<JSONObject> celldata = new ArrayList<>();
            celldata.addAll((List<JSONObject>) dbObject.get("celldata"));

            //整理celldata数据，转换为map格式，方便后续使用单元格位置获取对应的cell对象
            Map<String, JSONObject> cellDataMap = cellDataList2Map(celldata);
            //清除原有的数据
            dbObject.getJSONArray("celldata").clear();
            //获取配置项中的合并属性
            JSONObject merge = dbObject.getJSONObject("config").getJSONObject("merge");
            if (merge != null) {
                merge.clear();
            }
            //定义存储每一列动态扩展的行数
            Map<Integer, Integer> colAddCntMap = new HashMap<>();
            // 遍历已存在的单元格，查看是否存在动态参数
            for (int i = 0; i < celldata.size(); i++) {
                //单元格对象
                JSONObject cellObj = celldata.get(i);
                //fastjson深拷贝问题
                String cellStr = cellObj.toJSONString();
                analysisCellData(cellObj, setParam, colAddCntMap, cellStr, merge, dbObject, cellDataMap, setMap);
            }
        }
    }

    /**
     * 开始解析并渲染 cellData
     *
     * @param cellObject
     */
    public void analysisCellData(JSONObject cellObject, String setParam, Map<Integer, Integer> colAddCntMap, String cellStr,
                                 JSONObject merge, JSONObject dbObject, Map<String, JSONObject> cellDataMap, Map<String, OriginalDataDto> setMap) {
        //获取行号
        Integer cellR = cellObject.getInteger("r");
        //获取列数
        Integer cellC = cellObject.getInteger("c");
        //获取此行已经动态增加的行数，默认0行
        int cnt = colAddCntMap.get(cellC) == null ? 0 : colAddCntMap.get(cellC);
        //获取单元格类型
        CellType cellType = getCellType(cellObject);
        switch (cellType) {
            case BLACK:
                //空数据单元格不处理
                break;
            case DYNAMIC_MERGE:
            case DYNAMIC:
                //处理动态单元格
                String v = cellObject.getJSONObject("v").getString("v");
                DataSetDto dataSet = getDataSet(v, setParam);
                handleDynamicCellObject(dataSet, v, cellStr, cnt, cellR, cellC, merge, dbObject, colAddCntMap, setMap);
                break;
            default:
                //处理静态单元格
                handleStaticCellObject(cellStr, dbObject, cnt, cellR, cellC, cellDataMap, setParam, merge, colAddCntMap, cellType, setMap);
                break;
        }
    }

    /**
     * 处理动态数据单元格自动扩展
     *
     * @param dataSet
     * @param v
     * @param cellStr
     * @param cnt
     * @param r
     * @param c
     * @param merge
     * @param dbObject
     * @param colAddCntMap
     */
    public void handleDynamicCellObject(DataSetDto dataSet, String v, String cellStr, int cnt, int r, int c,
                                        JSONObject merge, JSONObject dbObject, Map<Integer, Integer> colAddCntMap, Map<String, OriginalDataDto> setMap) {
        //获取动态数据
        OriginalDataDto originalDataDto;
        if (dataSet != null && setMap.containsKey(dataSet.getSetCode())) {
            originalDataDto = setMap.get(dataSet.getSetCode());
        } else {
            originalDataDto = dataSetService.getData(dataSet);
            setMap.put(dataSet.getSetCode(), originalDataDto);
        }
        List<JSONObject> cellDynamicData = originalDataDto.getData();

        if (cellDynamicData != null) {
            //循环数据赋值
            for (int j = 0; j < cellDynamicData.size(); j++) {
                //新增的行数据
                JSONObject addCell = cellDynamicData.get(j);
                //字段
                String fieldLabel = addCell.getString(dataSet.getFieldLabel());
                if (StringUtils.isBlank(fieldLabel)) {
                    fieldLabel = StringUtils.EMPTY;
                }
                String replace = v.replace("#{".concat(dataSet.getSetCode()).concat(".").concat(dataSet.getFieldLabel()).concat("}"), fieldLabel);
                //转字符串，解决深拷贝问题
                JSONObject addCellData = JSONObject.parseObject(cellStr);

                addCellData.put("r", cnt + r + j); //行数增加
                addCellData.put("c", c);
                addCellData.getJSONObject("v").put("v", replace);
                addCellData.getJSONObject("v").put("m", replace);
                JSONObject cellMc = addCellData.getJSONObject("v").getJSONObject("mc");
                //判断是否是合并单元格
                if (null != cellMc) {
                    //处理合并单元格
                    Integer rs = cellMc.getInteger("rs");
                    cellMc.put("r", cnt + r + rs * j); //行数增加
                    cellMc.put("c", c);
                    addCellData.put("r", cnt + r + rs * j);
                    //合并单元格需要处理config.merge
                    merge.put(cellMc.getString("r") + "_" + cellMc.getString("c"), cellMc);
                    //处理单元格扩展之后此列扩展的总行数
                    colAddCntMap.put(c, cnt + rs * cellDynamicData.size() - 1);
                } else {
                    //处理单元格扩展之后此列扩展的总行数
                    colAddCntMap.put(c, cnt + cellDynamicData.size() - 1);
                }
                dbObject.getJSONArray("celldata").add(addCellData);
            }
        }
    }

    /**
     * 处理静态单元格数据
     *
     * @param cellStr
     * @param dbObject
     * @param cnt
     * @param r
     * @param c
     * @param cellDataMap
     * @param setParam
     * @param merge
     * @param colAddCntMap
     * @param cellType
     */
    public void handleStaticCellObject(String cellStr, JSONObject dbObject, int cnt, int r, int c,
                                       Map<String, JSONObject> cellDataMap, String setParam,
                                       JSONObject merge, Map<Integer, Integer> colAddCntMap, CellType cellType, Map<String, OriginalDataDto> setMap) {
        //转字符串，解决深拷贝问题
        JSONObject addCellData = JSONObject.parseObject(cellStr);
        int rows = 0;
        switch (cellType) {
            case STATIC:
            case STATIC_MERGE:
                //静态不扩展单元格只需要初始化位置就可以
                initCellPosition(addCellData, cnt, merge);
                break;
            case STATIC_AUTO:
                //获取静态单元格右侧动态单元格的总行数
                rows = getRightDynamicCellRows(addCellData, cellDataMap, setParam, rows, cellType, setMap);
                initCellPosition(addCellData, cnt, merge);
                if (rows > 1) {
                    //需要把这个静态扩展单元格 改变为 静态合并扩展单元格，就是增加合并属性 mc 以及merge配置
                    JSONObject mc = new JSONObject();
                    mc.put("rs", rows);
                    mc.put("cs", 1);
                    mc.put("r", addCellData.getIntValue("r"));
                    mc.put("c", addCellData.getIntValue("c"));
                    addCellData.getJSONObject("v").put("mc", mc);
                    //合并单元格需要处理config.merge
                    merge.put((mc.getInteger("r")) + "_" + mc.getString("c"), mc);
                    //处理单元格扩展之后此列扩展的总行数
                    colAddCntMap.put(c, cnt + rows - 1);
                }
                break;
            case STATIC_MERGE_AUTO:
                //获取静态单元格右侧动态单元格的总行数
                rows = getRightDynamicCellRows(addCellData, cellDataMap, setParam, rows, cellType, setMap);
                initCellPosition(addCellData, cnt, merge);
                if (rows > 0) {
                    //需要修改单元格mc中的rs
                    JSONObject cellMc = addCellData.getJSONObject("v").getJSONObject("mc");
                    int addCnt = cellMc.getInteger("rs");
                    cellMc.put("rs", rows);
                    //合并单元格需要处理config.merge
                    merge.put((cellMc.getInteger("r")) + "_" + cellMc.getString("c"), cellMc);
                    //处理单元格扩展之后此列扩展的总行数
                    colAddCntMap.put(c, cnt + rows - addCnt);
                }
                break;
        }
        dbObject.getJSONArray("celldata").add(addCellData);
    }

    /**
     * 初始化单元格位置，主要是这一列已经动态增加的行数
     *
     * @param addCellData
     * @param cnt
     * @param merge
     */
    public void initCellPosition(JSONObject addCellData, int cnt, JSONObject merge) {
        addCellData.put("r", cnt + addCellData.getInteger("r"));//行数增加
        //是否是合并单元格
        JSONObject mc = addCellData.getJSONObject("v").getJSONObject("mc");
        if (mc != null) {
            mc.put("r", addCellData.getInteger("r"));
            initCellMerge(merge, mc);
        }
    }

    /**
     * 初始化单元格合并属性的行数
     *
     * @param merge
     * @param mc
     */
    public void initCellMerge(JSONObject merge, JSONObject mc) {
        merge.put((mc.getInteger("r")) + "_" + mc.getString("c"), mc);
    }

    /**
     * 获取合并单元格右侧的动态扩展行数，用来设置当前单元格的实际
     *
     * @param addCellData
     * @param cellDataMap
     * @param setParam
     * @param sumRows
     * @param cellType
     * @return
     */
    public int getRightDynamicCellRows(JSONObject addCellData, Map<String, JSONObject> cellDataMap, String setParam, int sumRows, CellType cellType, Map<String, OriginalDataDto> setMap) {
        //1、获取此单元格右侧关联的所有单元格
        List<JSONObject> rightCellList = getRightDynamicCell(addCellData, cellDataMap, cellType);
        //2、循环获取每个单元格的扩展行数
        for (JSONObject rightCell : rightCellList) {
            //首先判断这个单元格是否也是【静态扩展单元格】
            CellType rightCellType = getCellType(rightCell);
            switch (rightCellType) {
                case STATIC_AUTO:
                case STATIC_MERGE_AUTO:
                    //递归查找
                    sumRows = getRightDynamicCellRows(rightCell, cellDataMap, setParam, sumRows, rightCellType, setMap);
                    break;
                case BLACK:
                case STATIC:
                    sumRows++;
                    break;
                case STATIC_MERGE:
                    sumRows += rightCell.getJSONObject("v").getJSONObject("mc").getInteger("rs");
                    break;
                default:
                    List<JSONObject> cellDynamicData = getDynamicDataList(rightCell.getJSONObject("v").getString("v"), setParam, setMap);
                    if (cellDynamicData != null && cellDynamicData.size() > 1) {
                        int size = cellDynamicData.size();
                        sumRows += size;
                    } else {
                        sumRows++;
                    }
                    break;
            }
        }
        return sumRows;
    }

    /**
     * 获取扩展单元格右侧相邻的所有单元格实体
     *
     * @param addCellData
     * @param cellDataMap
     * @param cellType
     * @return
     */
    public List<JSONObject> getRightDynamicCell(JSONObject addCellData, Map<String, JSONObject> cellDataMap, CellType cellType) {
        //静态数据合并单元格需要根据右侧的单元格进行自动向下扩展
        //1、先获取右侧一列的关联的单元格，根据自身的位置，以及自己合并的合并的信息推断
        //如果自己位置是 2，5，并且本身合并 行数2，列数3，则需要推断出两个单元格的位置
        //分别是2，8 和 3，8
        Integer cellR = addCellData.getInteger("r");
        Integer cellC = addCellData.getInteger("c");
        Integer cellRs = 0;
        Integer cellCs = 0;
        switch (cellType) {
            case STATIC_AUTO:
                cellRs = 1;
                cellCs = 1;
                break;
            case STATIC_MERGE_AUTO:
                cellRs = addCellData.getJSONObject("v").getJSONObject("mc").getInteger("rs");
                cellCs = addCellData.getJSONObject("v").getJSONObject("mc").getInteger("cs");
                break;
        }
        List<JSONObject> rightCells = new ArrayList<>();
        for (int nums = 0; nums < cellRs; nums++) {
            int r = cellR + nums;
            int c = cellC + cellCs;
            String key = r + "," + c;
            if (cellDataMap.containsKey(key)) {
                JSONObject cellData = cellDataMap.get(r + "," + c);
                rightCells.add(cellData);
            }
        }
        return rightCells;
    }

    /**
     * 判断单元格类型
     *
     * @param cellObject
     * @return
     */
    public CellType getCellType(JSONObject cellObject) {
        JSONObject cellV1 = cellObject.getJSONObject("v");
        if (null != cellV1 && cellV1.containsKey("v") && StringUtils.isNotBlank(cellV1.getString("v"))) {
            String cellV2 = cellObject.getJSONObject("v").getString("v");
            String auto = cellObject.getJSONObject("v").getString("auto");
            JSONObject mc = cellObject.getJSONObject("v").getJSONObject("mc");
            if (cellV2.contains("#{") && cellV2.contains("}")) {
                //动态单元格
                if (mc != null) {
                    return CellType.DYNAMIC_MERGE;
                } else {
                    return CellType.DYNAMIC;
                }
            } else {
                //静态单元格
                if (mc != null && "1".equals(auto)) {
                    return CellType.STATIC_MERGE_AUTO;
                } else {
                    if ("1".equals(auto)) {
                        return CellType.STATIC_AUTO;
                    } else if (mc != null) {
                        return CellType.STATIC_MERGE;
                    } else {
                        return CellType.STATIC;
                    }
                }
            }
        } else {
            return CellType.BLACK;
        }
    }

    /**
     * list转为map结构，方便使用行列号查找对应cell对象
     *
     * @param cellDataList
     * @return
     */
    public Map<String, JSONObject> cellDataList2Map(List<JSONObject> cellDataList) {
        Map<String, JSONObject> cellDataMap = new HashMap<>();
        for (JSONObject cellData : cellDataList) {
            String r = cellData.getString("r");
            String c = cellData.getString("c");
            cellDataMap.put(r + "," + c, cellData);
        }
        return cellDataMap;
    }

    /**
     * 解析 #{xxxx.xxxxx} 数据
     *
     * @param v
     * @return
     */
    private DataSetDto getDataSet(String v, String setParam) {

        DataSetDto dto = new DataSetDto();
        if (v.contains("#{") && v.contains("}")) {
            int start = v.indexOf("#{") + 2;
            int end = v.indexOf("}");
            if (start < end) {
                String substring = v.substring(start, end);
                if (substring.contains(".")) {
                    String[] split = substring.split("\\.");
                    dto.setSetCode(split[0]);
                    dto.setFieldLabel(split[1]);
                    getContextData(setParam, dto);
                    return dto;
                }
            }
        }
        return null;
    }

    /**
     * 获取单元格对应的动态数据集
     *
     * @param v
     * @param setParam
     * @return
     */
    private List<JSONObject> getDynamicDataList(String v, String setParam, Map<String, OriginalDataDto> setMap) {
        if (StringUtils.isNotBlank(v)) {
            DataSetDto dataSet = getDataSet(v, setParam);
            if (dataSet != null) {
                OriginalDataDto originalDataDto;
                if (setMap.containsKey(dataSet.getSetCode())) {
                    originalDataDto = setMap.get(dataSet.getSetCode());
                } else {
                    originalDataDto = dataSetService.getData(dataSet);
                    setMap.put(dataSet.getSetCode(), originalDataDto);
                }
                return originalDataDto.getData();
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * 动态参数替换
     *
     * @param setParam
     * @param dto
     */
    private void getContextData(String setParam, DataSetDto dto) {
        if (StringUtils.isNotBlank(setParam)) {
            JSONObject setParamJson = JSONObject.parseObject(setParam);
            Map<String, Object> map = new HashMap<>();
            // 查询条件
            if (setParamJson.containsKey(dto.getSetCode())) {
                JSONObject paramCondition = setParamJson.getJSONObject(dto.getSetCode());
                map.putAll(paramCondition);
            }
            dto.setContextData(map);
        }
    }

}
