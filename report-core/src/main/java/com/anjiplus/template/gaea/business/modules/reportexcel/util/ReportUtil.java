package com.anjiplus.template.gaea.business.modules.reportexcel.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.anji.plus.gaea.export.utils.QrCodeOrBarCodeUtil;
import com.anjiplus.template.gaea.business.modules.dataSet.controller.dto.DataSetDto;
import com.anjiplus.template.gaea.business.modules.dataSet.controller.dto.OriginalDataDto;
import com.anjiplus.template.gaea.business.modules.dataSet.service.DataSetService;
import com.anjiplus.template.gaea.business.modules.report.constant.ExpConstant;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto.ReportExcelDto;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ddf.EscherClientAnchorRecord;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.OptionalDouble;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/3/26 10:30
 */
@Component
public class ReportUtil {

    /**
     * 记录日志
     */
    protected static Logger logger = LoggerFactory.getLogger(ReportUtil.class);

    @Autowired
    private DataSetService dataSetService;


    public JSONObject reportParse(ReportExcelDto reportExcelDto) {

        // 取第一个sheet
        JSONObject jsonObject = JSONObject.parseObject(reportExcelDto.getJsonStr(), Feature.OrderedField).getJSONArray("sheet").getJSONObject(0);
//        JSONObject jsonObject = JSONObject.parseObject(reportExcelDto.getJsonStr());

        logger.info("excelJSON信息：{}\n", jsonObject);
        JSONObject rowsJsonObject = jsonObject.getJSONObject("rows");
        // 所有的样式数组。
        JSONArray styles = jsonObject.getJSONArray("styles");
//        System.out.println(styles);
        logger.info("需要解析的JSON {}", rowsJsonObject);

        //用于存储语法解析后的json
        JSONObject syntaxJsonObject = new JSONObject(true);

        Map<String, Object> dataSetMap = new HashMap<>();

        Map<Integer, List<Object>> map = new HashMap<>();
        rowsJsonObject.remove("len");
        for (String s : rowsJsonObject.keySet()) {
            List<Object> list = Collections.singletonList(rowsJsonObject.getJSONObject(s));
            map.put(Integer.parseInt(s), list);
        }

        // 解决rows 行乱序
        syntaxParse(map, syntaxJsonObject, reportExcelDto.getSetCodes(), reportExcelDto.getSetParam(), dataSetMap);
        JSONObject jsonMap = new JSONObject(true);

        JSONObject jsonObject1 = JSONObject.parseObject(JSON.toJSONString(syntaxJsonObject), Feature.OrderedField);
        jsonObject1.put("len", jsonObject1.size() + 30);
        jsonObject.put("rows", jsonObject1);
        jsonObject.put("name", reportExcelDto.getReportName());
        return jsonObject;
    }

    /**
     * 包含动态表达式的行解析
     *
     * @param mapss            rows
     * @param syntaxJsonObject 存储解析后的json
     * @param dbCode           编码
     * @param setParam         查询条件数据集
     * @param dataSetMap       数据集
     */
    public void syntaxParse(Map<Integer, List<Object>> mapss, JSONObject syntaxJsonObject, String dbCode, String setParam, Map<String, Object> dataSetMap) {

        String[] split = dbCode.split("\\|");
        // 解析过几次表达式列。
        int count = 1;
        for (Map.Entry<Integer, List<Object>> integerListEntry : mapss.entrySet()) {
            List<Object> listobj = Stream.of(integerListEntry.getValue()).collect(Collectors.toList());
            JSONArray jsonObject1 = JSONArray.parseArray(listobj.toString());
            JSONArray jsonArray = (JSONArray) jsonObject1.get(0);
            // cells json
            JSONObject jsonObject2 = JSONObject.parseObject(jsonArray.get(0).toString());
            for (Map.Entry<String, Object> stringObjectEntry2 : jsonObject2.entrySet()) {
                if (stringObjectEntry2.getKey() == "cells") {
                    JSONObject cell = (JSONObject) stringObjectEntry2.getValue();
                    if (jsonObject2.toString().contains("#{")) {

                        for (int i = 0; i < split.length; i++) {
                            JSONObject setParamJson = JSONObject.parseObject(setParam);

                            String code = split[i];

                            String newCode = String.format("#{%s", code);
                            //  如果表达式包含具体code编码，进。否则不做处理
                            if (jsonObject2.toString().contains(newCode) && StringUtils.isNotBlank(code)) {
                                DataSetDto dto = new DataSetDto();
                                dto.setSetCode(code);
                                Map<String, Object> map = new HashMap<>();
                                // 查询条件
                                if (setParamJson.containsKey(code)) {
                                    JSONObject paramCondition = setParamJson.getJSONObject(code);
                                    paramCondition.entrySet().forEach(item -> map.put(item.getKey(), item.getValue()));
                                }

                                dto.setContextData(map);
                                OriginalDataDto originalDataDto = dataSetService.getData(dto);
                                dataSetMap.clear();
                                List<JSONObject> list = (List<JSONObject>) JSONObject.toJSON(originalDataDto.getData());
                                dataSetMap.put("list", list);
                                boolean flag = true;
                                //仅拿到为cells的json  ，目前推拽有问题，会存在 列为-1 ，排除掉不解析
                                for (Map.Entry<String, Object> objectEntry : cell.entrySet()) {
                                    JSONObject object = (JSONObject) objectEntry.getValue();
                                    for (Map.Entry<String, Object> stringObjectEntry : object.entrySet()) {
                                        if (stringObjectEntry.getKey().equals("-1")) {
                                            flag = false;
                                        }
                                    }
                                }
                                if (flag) {
                                    if (syntaxJsonObject.size() == 0) {
                                        StringBuffer sb = new StringBuffer();
                                        String str = jsonObject2.toString().replaceAll("#\\{", "\\${");
                                        sb.append(String.format("{<#list list as %s> ", code));
                                        sb.append(String.format("\"${%s_index+%s}\":%s,", code, integerListEntry.getKey(), str));
                                        sb.append("</#list>");
                                        sb.append("}");
                                        logger.info("替换后的str： {}", sb);
                                        String parseJsonStr = parseTemplate(sb.toString(), dataSetMap);
                                        if (parseJsonStr.equals("{}")) {
                                            syntaxJsonObject.putAll(isNullParseJson(jsonObject2, newCode, syntaxJsonObject.size(), integerListEntry.getKey(), 0));
                                        } else {
                                            syntaxJsonObject.putAll(JSONObject.parseObject(parseJsonStr, Feature.OrderedField));
                                        }
                                    } else {
                                        StringBuffer sb = new StringBuffer();
                                        String str = jsonObject2.toString().replaceAll("#\\{", "\\${").replaceAll("\\\\n", "");
                                        sb.append(String.format("{<#list list as %s> ", code));
                                        sb.append(String.format("\"${%s_index+%s}\":%s,", code, syntaxJsonObject.size() + integerListEntry.getKey() - count, str));
                                        sb.append("</#list>");
                                        sb.append("}");
                                        logger.info("替换后的str： {}", sb);
                                        String parseJsonStr = parseTemplate(sb.toString(), dataSetMap);
                                        syntaxJsonObject.putAll(JSONObject.parseObject(parseJsonStr, Feature.OrderedField));
                                        // 如果查出来没有数据，会被替换为 {} ，不能put到  syntaxJsonObject，就会少一行，不操作count
                                        if (parseJsonStr.equals("{}")) {
                                            syntaxJsonObject.putAll(isNullParseJson(jsonObject2, newCode, syntaxJsonObject.size(), integerListEntry.getKey(), count));
                                        } else {
                                            syntaxJsonObject.putAll(JSONObject.parseObject(parseJsonStr, Feature.OrderedField));
                                        }
                                        count++;
                                    }
                                }
                            }
                        }
                        // 存在 函数表达式
                    } else if (!CollectionUtils.isEmpty(ExpConstant.getExpFunction(jsonObject2.toString()))) {
                        // 函数下标集合
                        List<Integer> indexs = ExpConstant.getExpFunction(jsonObject2.toString());
                        for (Integer index : indexs) {
                            // 函数值
                            String exp = ExpConstant.FUNCTION[index];

                            List<BigDecimal> bigDecimalList = new ArrayList<>();
                            for (Map.Entry<String, Object> entryHanShu : jsonObject2.entrySet()) {
                                JSONObject jb3 = (JSONObject) entryHanShu.getValue();
                                for (Map.Entry<String, Object> entry4 : jb3.entrySet()) {
                                    // 得到最下面的   {"style":1,"text":"=SUM(A3)"}
                                    JSONObject cellJson = (JSONObject) entry4.getValue();
                                    if (cellJson.containsKey("text")) {
                                        if (StringUtils.isNotBlank(cellJson.get("text").toString()) && cellJson.get("text").toString().contains(exp)) {
                                            for (Map.Entry<String, Object> rowsJson : syntaxJsonObject.entrySet()) {
                                                // 拿到一行 中的cells
                                                JSONObject rowsJsonToCells = (JSONObject) JSONObject.parseObject(rowsJson.getValue().toString()).get("cells");
                                                if (rowsJsonToCells.containsKey(entry4.getKey())) {
                                                    JSONObject textJson = (JSONObject) rowsJsonToCells.get(entry4.getKey());
                                                    if (textJson.containsKey("text")) {
                                                        // 列值。
                                                        String value = textJson.get("text").toString();
                                                        try {
                                                            bigDecimalList.add(new BigDecimal(value));
                                                        } catch (Exception exception) {
                                                            logger.info("函数计算错误，错误列{}、值{}", entry4, value);
                                                        }
                                                    }
                                                }
                                            }
                                            if (!CollectionUtils.isEmpty(bigDecimalList)) {
                                                switch (exp) {
                                                    case "=MIN(":
                                                        Optional<BigDecimal> min = bigDecimalList.stream().min((o1, o2) -> o1.compareTo(o2));
                                                        cellJson.replace("text", cellJson.get("text"), min.get() + "");
                                                        break;
                                                    case "=MAX(":
                                                        Optional<BigDecimal> max = bigDecimalList.stream().max((o1, o2) -> o1.compareTo(o2));
                                                        cellJson.replace("text", cellJson.get("text"), max.get() + "");
                                                        break;
                                                    case "=SUM(":
                                                        BigDecimal sums = bigDecimalList.stream().reduce(BigDecimal.ZERO, BigDecimal::add);
                                                        cellJson.replace("text", cellJson.get("text"), sums + "");
                                                        break;
                                                    case "=AVERAGE(":
                                                        OptionalDouble average = bigDecimalList.stream().mapToDouble(BigDecimal::doubleValue).average();
                                                        cellJson.replace("text", cellJson.get("text"), average.getAsDouble() + "");
                                                        break;
                                                    default:
                                                        break;
                                                }
                                            } else {
                                                cellJson.replace("text", cellJson.get("text"), "");
                                            }
                                        }
                                    }
                                }
                            }

                        }
                        if (syntaxJsonObject.size() == 0) {
                            syntaxJsonObject.put(integerListEntry.getKey() + "", jsonObject2);
                        } else {
                            syntaxJsonObject.put(syntaxJsonObject.size() + integerListEntry.getKey() - count + "", jsonObject2);
                            count++;
                        }
                    } else {

                        if (count == 1 && syntaxJsonObject.size() == 0) {
                            syntaxJsonObject.put(integerListEntry.getKey() + "", jsonObject2);
                        } else {
                            syntaxJsonObject.put(syntaxJsonObject.size() + integerListEntry.getKey() - count + "", jsonObject2);
                            count++;
                        }
                    }
                }
            }
        }

    }

    /**
     * 解析的表达式未null 即 {}
     *
     * @param jsonObject 本行json
     * @param newCode    表达式编码
     * @param syntax     存储解析后的json大小
     * @param entryNum   本次循环的num
     * @param count
     * @return
     */
    public static JSONObject isNullParseJson(JSONObject jsonObject, String newCode, Integer syntax, Integer entryNum, int count) {
        JSONObject cellsJson = jsonObject.getJSONObject("cells");
        for (Map.Entry<String, Object> entry : cellsJson.entrySet()) {
            JSONObject elementJson = JSONObject.parseObject(entry.getValue().toString());
            if (elementJson.containsKey("text")) {
                String text = (String) elementJson.get("text");
                if (text.contains(newCode)) {
                    elementJson.put("text", "");
                }
            }
            cellsJson.put(entry.getKey(), elementJson);
        }
        jsonObject.put("cells", cellsJson);
        JSONObject newJson = new JSONObject();
        newJson.put(String.valueOf((syntax + entryNum - count)), jsonObject);
        return newJson;
    }

    /**
     * 报表格式化解析
     *
     * @param templateValue
     * @param maps
     * @return
     */
    private static String parseTemplate(String templateValue, Map<String, Object> maps) {
        try {
            Configuration configuration = new Configuration();
            configuration.setNumberFormat("#.#########");
            configuration.setClassicCompatible(true);
            StringWriter writer = new StringWriter();
            Template template = new Template("template", new StringReader(templateValue), configuration);
            template.process(maps, writer);
            return writer.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        String str = "{\"sheet\":[{\"name\":\"sheet2\",\"freeze\":\"A1\",\"styles\":[{\"valign\":\"top\"}],\"merges\":[],\"rows\":{\"0\":{\"cells\":{\"0\":{\"text\":{\"type\":\"QRCode\",\"content\":\"http://gaea.anji-plus.com\",\"width\":125,\"height\":125,\"ri\":0,\"ci\":0},\"style\":0}},\"height\":163},\"len\":100},\"cols\":{\"len\":20},\"validations\":[],\"autofilter\":{}}]}";

        // 取第一个sheet
        JSONObject jsonObject = JSONObject.parseObject(str);
//        XSSFWorkbook workbook = new XSSFWorkbook();
//        XSSFSheet sheet = workbook.createSheet();
        try {
            exportExcel(jsonObject);
//            makePhoto(jsonArray , workbook , sheet);
//            workbook.write(new FileOutputStream("E:\\excel\\e\\dsad.xlsx"));
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public static Map<String, Object> exportExcel(JSONObject a) {
//        JSONObject jsonObject = JSONObject.parseObject(result.getJsonStr());
        JSONObject jsonObject = a.getJSONArray("sheet").getJSONObject(0);
        JSONObject rows = jsonObject.getJSONObject("rows");
        JSONObject cols = jsonObject.getJSONObject("cols");
        if (cols.containsKey("len")) {
            cols.remove("len");
        }
        EscherClientAnchorRecord escherClientAnchorRecord;

        if (rows.containsKey("-1")) {
            rows.remove("-1");
        }
//        JSONArray photos = jsonObject.getJSONArray("QRCodeOrBarCode");
        // 所有的样式数组。
        JSONArray styles = jsonObject.getJSONArray("styles");

//        1.创建一个工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();


//        2.创建一个工作表
        XSSFSheet sheet = workbook.createSheet("news");
        try {
            sheet.autoSizeColumn(1, true);
            // 设置默认列宽
            sheet.setDefaultColumnWidth(12);
            sheet.setDefaultRowHeight((short) 360);
            Iterator<String> colsIte = cols.keySet().iterator();
            while (colsIte.hasNext()) {
                String next = colsIte.next();   //列
                JSONObject colStyle = cols.getJSONObject(next);
                if (colStyle.containsKey("width")) {
                    // 自定义 width * 32
                    sheet.setColumnWidth(Integer.parseInt(next), colStyle.getInteger("width") * 30);
                }
            }

//            if (photos != null) {
//                // make photo
//                makePhoto(photos, workbook, sheet);
//            }
            for (Map.Entry<String, Object> entry : rows.entrySet()) {
                if (!entry.getKey().contains("len")) {

                    // 创建一行
                    Row row = sheet.createRow(Integer.parseInt(entry.getKey()));
                    JSONObject jsonObject1 = (JSONObject) entry.getValue();

                    //设置行高
                    if (jsonObject1.containsKey("height")) {
                        int height = (int) jsonObject1.get("height");
                        row.setHeight((short) (height * 14.7));
                    }
                    // cells 获取到一行
                    JSONObject cells = (JSONObject) jsonObject1.get("cells");
                    if (cells.containsKey("-1")) {
                        cells.remove("-1");
                    }

                    setCellStyle(cells, workbook , sheet , styles, row);

                }
            }

            Iterator<String> iterator = rows.keySet().iterator();
            while (iterator.hasNext()) {
                String rownum = iterator.next();    //行
                if (rownum.equals("len")) {
                    continue;
                }
                JSONObject cells = rows.getJSONObject(rownum).getJSONObject("cells");
                if (cells == null) {
                    continue;
                } else {
                    Iterator<String> cellsIte = cells.keySet().iterator();
                    while (cellsIte.hasNext()) {
                        String cellnum = cellsIte.next();    //列
                        JSONObject cellJSON = cells.getJSONObject(cellnum);
                        if (cellJSON != null) {
                            if (cellJSON.containsKey("merge")) {
                                List<Integer> list = (List<Integer>) cellJSON.get("merge");
//                        // 起始行, 终止行, 起始列, 终止列
                                CellRangeAddress cra = new CellRangeAddress(Integer.parseInt(rownum), Integer.parseInt(rownum) + list.get(0), Integer.parseInt(cellnum), Integer.parseInt(cellnum) + list.get(1));
                                sheet.addMergedRegion(cra);


                                if (cellJSON.containsKey("style")) {
                                    int style = (int) cellJSON.get("style");
                                    JSONObject jsonObject4 = (JSONObject) styles.get(style);
                                    if (jsonObject4.containsKey("border")) {
                                        JSONObject borders = (JSONObject) jsonObject4.get("border");

                                        Iterator<String> borderIterator = borders.keySet().iterator();
                                        while (borderIterator.hasNext()) {
                                            String borderSide = borderIterator.next();
                                            // 设置单元格的边框
                                            switch (borderSide) {
                                                case "top":
                                                    JSONArray top = borders.getJSONArray("top");
                                                    // 上边框
                                                    RegionUtil.setBorderTop(BorderStyle.valueOf(top.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                case "left":
                                                    JSONArray left = borders.getJSONArray("left");
                                                    // 左边框
                                                    RegionUtil.setBorderLeft(BorderStyle.valueOf(left.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                case "bottom":
                                                    JSONArray bottom = borders.getJSONArray("bottom");
                                                    // 下边框
                                                    RegionUtil.setBorderBottom(BorderStyle.valueOf(bottom.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                case "right":
                                                    JSONArray right = borders.getJSONArray("right");
                                                    // 右边框
                                                    RegionUtil.setBorderRight(BorderStyle.valueOf(right.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                default:
                                                    break;
                                            }
                                        }
                                    }
                                }

                            }
                        }

                    }
                }
            }




            String fileName = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());

            FileOutputStream fos = new FileOutputStream("E:\\excel\\e\\" + fileName + ".xlsx");
            workbook.write(fos);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Map<String, Object> exportExcel(ReportExcelDto result) {
        // 取第一个sheet
//        JSONObject jsonObject = JSONObject.parseObject(result.getJsonStr(), Feature.OrderedField).getJSONArray("sheet").getJSONObject(0);
        JSONObject jsonObject = JSONObject.parseObject(result.getJsonStr());
//        jsonObject.put("QRCodeOrBarCode", "[\n" +
//                "        {\n" +
//                "            \"type\": \"QRCode\",\n" +
//                "            \"content\": \"https://gaea.anji-plus.com\",\n" +
//                "            \"height\": \"128\",\n" +
//                "            \"width\": \"128\",\n" +
//                "            \"backgroundColor\": \"#FFFFFF\",\n" +
//                "            \"foregroundColor\": \"#000000\",\n" +
//                "            \"ri\": 1,\n" +
//                "            \"ci\": \"1\"\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"type\": \"BarCode\",\n" +
//                "            \"content\": \"6926557300360\",\n" +
//                "            \"height\": \"50\",\n" +
//                "            \"width\": \"450\",\n" +
//                "            \"backgroundColor\": \"#FFFFFF\",\n" +
//                "            \"foregroundColor\": \"#000000\",\n" +
//                "            \"ri\": 1,\n" +
//                "            \"ci\": \"1\"\n" +
//                "        }\n" +
//                "    ]");
        JSONObject rows = (JSONObject) jsonObject.get("rows");
        JSONObject cols = (JSONObject) jsonObject.get("cols");
        if (cols.containsKey("len")) {
            cols.remove("len");
        }
        if (rows.containsKey("-1")) {
            rows.remove("-1");
        }
        JSONArray photos = jsonObject.getJSONArray("QRCodeOrBarCode");
        // 所有的样式数组。
        JSONArray styles = jsonObject.getJSONArray("styles");

//        1.创建一个工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();


//        2.创建一个工作表
        XSSFSheet sheet = workbook.createSheet(result.getReportName());
        try {
            sheet.autoSizeColumn(1, true);
            // 设置默认列宽
            sheet.setDefaultColumnWidth(12);
            Iterator<String> colsIte = cols.keySet().iterator();
            while (colsIte.hasNext()) {
                String next = colsIte.next();   //列
                JSONObject colStyle = cols.getJSONObject(next);
                if (colStyle.containsKey("width")) {
                    // 自定义 width * 32
                    sheet.setColumnWidth(Integer.parseInt(next), colStyle.getInteger("width") * 32);
                }
            }
            for (Map.Entry<String, Object> entry : rows.entrySet()) {
                if (!entry.getKey().contains("len")) {

                    // 创建一行
                    Row row = sheet.createRow(Integer.parseInt(entry.getKey()));
                    JSONObject jsonObject1 = (JSONObject) entry.getValue();

                    //设置行高
                    if (jsonObject1.containsKey("height")) {
                        int height = (int) jsonObject1.get("height");
                        row.setHeight((short) (height * 14.7));
                    } else {
                        row.setHeight((short) 360);
                    }
                    // cells 获取到一行
                    JSONObject cells = (JSONObject) jsonObject1.get("cells");
                    if (cells.containsKey("-1")) {
                        cells.remove("-1");
                    }

                    setCellStyle(cells, workbook, sheet , styles, row);

                }
            }

            Iterator<String> iterator = rows.keySet().iterator();
            while (iterator.hasNext()) {
                String rownum = iterator.next();    //行
                if (rownum.equals("len")) {
                    continue;
                }
                JSONObject cells = rows.getJSONObject(rownum).getJSONObject("cells");
                if (cells == null) {
                    continue;
                } else {
                    Iterator<String> cellsIte = cells.keySet().iterator();
                    while (cellsIte.hasNext()) {
                        String cellnum = cellsIte.next();    //列
                        JSONObject cellJSON = cells.getJSONObject(cellnum);
                        if (cellJSON != null) {
                            if (cellJSON.containsKey("merge")) {
                                List<Integer> list = (List<Integer>) cellJSON.get("merge");
//                        // 起始行, 终止行, 起始列, 终止列
                                CellRangeAddress cra = new CellRangeAddress(Integer.parseInt(rownum), Integer.parseInt(rownum) + list.get(0), Integer.parseInt(cellnum), Integer.parseInt(cellnum) + list.get(1));
                                sheet.addMergedRegion(cra);


                                if (cellJSON.containsKey("style")) {
                                    int style = (int) cellJSON.get("style");
                                    JSONObject jsonObject4 = (JSONObject) styles.get(style);
                                    if (jsonObject4.containsKey("border")) {
                                        JSONObject borders = (JSONObject) jsonObject4.get("border");

                                        Iterator<String> borderIterator = borders.keySet().iterator();
                                        while (borderIterator.hasNext()) {
                                            String borderSide = borderIterator.next();
                                            // 设置单元格的边框
                                            switch (borderSide) {
                                                case "top":
                                                    JSONArray top = borders.getJSONArray("top");
                                                    // 上边框
                                                    RegionUtil.setBorderTop(BorderStyle.valueOf(top.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                case "left":
                                                    JSONArray left = borders.getJSONArray("left");
                                                    // 左边框
                                                    RegionUtil.setBorderLeft(BorderStyle.valueOf(left.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                case "bottom":
                                                    JSONArray bottom = borders.getJSONArray("bottom");
                                                    // 下边框
                                                    RegionUtil.setBorderBottom(BorderStyle.valueOf(bottom.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                case "right":
                                                    JSONArray right = borders.getJSONArray("right");
                                                    // 右边框
                                                    RegionUtil.setBorderRight(BorderStyle.valueOf(right.get(0).toString().toUpperCase()).getCode(), cra, sheet);
                                                default:
                                                    break;
                                            }
                                        }
                                    }
                                }

                            }
                        }

                    }
                }
            }
            Map<String, Object> map = new HashMap<>();
            if (photos != null) {
                // make photo
                makePhoto(photos, workbook, sheet);
            }
            String fileName = result.getReportName() + (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());

            FileOutputStream fos = new FileOutputStream("E:\\excel\\e\\" + fileName + ".xlsx");
            workbook.write(fos);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param cells    当前行每一列
     * @param workbook
     * @param styles   样式
     * @param row      当前行
     */
    private static void setCellStyle(JSONObject cells, XSSFWorkbook workbook, XSSFSheet sheet ,JSONArray styles, Row row) {

        for (Map.Entry<String, Object> entry2 : cells.entrySet()) {

            XSSFCellStyle cellStyle = workbook.createCellStyle();
            DataFormat df = workbook.createDataFormat();

            JSONObject jsonObject3 = (JSONObject) entry2.getValue();
            // 创建一列
            Cell cell = row.createCell(Integer.parseInt(entry2.getKey()));
            Object text = jsonObject3.get("text");
            String cellValue = null;
            if(text instanceof JSONObject){
                JSONObject jsonObject = (JSONObject) text;
                JSONArray jsonArray = new JSONArray();
                jsonArray.add(jsonObject);
                try {
                    makePhoto(jsonArray , workbook , sheet );
                } catch (Exception e) {
                    logger.info("makePhoto error" , e);
                }
            } else if(text instanceof String){
                cell = (Cell) text;
                // 创建第 某行 第几个单元格
                if (StringUtils.isNotBlank(cellValue)) {
                    cell.setCellValue(cellValue);
                    if (!CollectionUtils.isEmpty(ExpConstant.getExpFunction(cellValue))) {
                        cell.setCellFormula(cellValue.substring(1));
                        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
                        cell.setCellType(CellType.FORMULA);
                    }
                }
            }


            if (StringUtils.isNotBlank(jsonObject3.getString("style"))) {
                // 样式 id
                int style = (int) jsonObject3.get("style");
                JSONObject jsonObject4 = (JSONObject) styles.get(style);

                if (!jsonObject4.containsKey("valign")) {
                    cellStyle.setVerticalAlignment(VerticalAlignment.valueOf("CENTER"));
                } else {
                    String str1 = jsonObject4.getString("valign").toUpperCase();
                    if ("MIDDLE".equals(str1)) {
                        str1 = "CENTER";
                    }
                    cellStyle.setVerticalAlignment(VerticalAlignment.valueOf(str1));
                }
                // 设置局中
                if (jsonObject4.containsKey("align")) {
                    String align = (String) jsonObject4.get("align");
                    cellStyle.setAlignment(HorizontalAlignment.valueOf(align.toUpperCase()));

                }

                //------------------------bgColor
                if (jsonObject4.containsKey("bgcolor")) {

                    String str1 = jsonObject4.getString("bgcolor");
                    XSSFColor xSSFColor = new XSSFColor();
                    if (str1.indexOf("#") != -1) {
                        byte[] arrayOfByte = {(byte) Integer.parseInt(str1.substring(1, 3), 16), (byte) Integer.parseInt(str1.substring(3, 5), 16), (byte) Integer.parseInt(str1.substring(5, 7), 16)};
                        xSSFColor.setRGB(arrayOfByte);
                    }
                    cellStyle.setFillForegroundColor(xSSFColor);
                    cellStyle.setFillBackgroundColor(xSSFColor);
                    cellStyle.setFillPattern(FillPatternType.BIG_SPOTS);
                }


                if (jsonObject4.containsKey("format")) {
                    String format = (String) jsonObject4.get("format");
                    if(text instanceof String){
                        switch (format) {
                            case "formula":
                                // 函数
                                cell.setCellType(CellType.FORMULA);
                                break;
                            case "rmb":
                                //货币
                                if (StringUtils.isNotBlank(cellValue)) {
                                    try {

                                        cell.setCellValue(Integer.parseInt(cellValue));
                                        XSSFDataFormat xssfDataFormat = workbook.createDataFormat();
                                        cellStyle.setDataFormat(xssfDataFormat.getFormat("￥#,##0_);\\[Red](￥#,##0)"));
                                        cell.setCellStyle(cellStyle);
                                    } catch (Exception e) {
                                    }
                                }
                                break;
                            case "number":
                                // 数值
                                if (StringUtils.isNotBlank(cellValue)) {

                                    try {
                                        cell.setCellValue(Integer.parseInt(cellValue));
                                        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
                                        cell.setCellStyle(cellStyle);

                                    } catch (Exception e) {
                                    }
                                }
                                break;
                            case "date":

                                break;
                            case "date2":

                                break;
                            case "time":

                                break;
                            case "datetime":

                                break;
                            case "percent":
                                //百分比
                                if (StringUtils.isNotBlank(cellValue)) {

                                    try {
                                        cell.setCellValue(Integer.parseInt(cellValue) / 100);
                                        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00%"));
                                        cell.setCellStyle(cellStyle);

                                    } catch (Exception e) {
                                    }
                                }
                                break;
                            case "eur":
                                //欧元
                                if (StringUtils.isNotBlank(cellValue)) {
//
                                    try {

                                        cell.setCellValue(Integer.parseInt(cellValue));
                                        XSSFDataFormat xssfDataFormat = workbook.createDataFormat();
                                        cellStyle.setDataFormat(xssfDataFormat.getFormat("€#,##0_);\\[Red](￥#,##0)"));
                                        cell.setCellStyle(cellStyle);

                                    } catch (Exception e) {
                                    }
                                }
                                break;
                            case "usd":
                                //美元
                                if (StringUtils.isNotBlank(cellValue)) {
//
                                    try {
                                        cell.setCellValue(Integer.parseInt(cellValue));
                                        XSSFDataFormat xssfDataFormat = workbook.createDataFormat();
                                        cellStyle.setDataFormat(xssfDataFormat.getFormat("$#,##0_);\\[Red](￥#,##0)"));
                                        cell.setCellStyle(cellStyle);

                                    } catch (Exception e) {
                                    }
                                }
                                break;
                            default:
                                cell.setCellType(CellType.STRING);

                        }
                    }
                }
//                ------------------------------border--------------------------
                if (jsonObject4.containsKey("border")) {
                    JSONObject borders = (JSONObject) jsonObject4.get("border");

                    Iterator<String> borderIterator = borders.keySet().iterator();
                    while (borderIterator.hasNext()) {
                        String borderSide = borderIterator.next();
                        // 设置单元格的边框
                        switch (borderSide) {
                            case "top":
                                JSONArray top = borders.getJSONArray("top");
                                tracingBorder(BorderStyle.valueOf(top.get(0).toString().toUpperCase()).getCode(), "top", cellStyle);
                            case "left":
                                JSONArray left = borders.getJSONArray("left");
                                tracingBorder(BorderStyle.valueOf(left.get(0).toString().toUpperCase()).getCode(), "left", cellStyle);
                            case "bottom":
                                JSONArray bottom = borders.getJSONArray("bottom");
                                tracingBorder(BorderStyle.valueOf(bottom.get(0).toString().toUpperCase()).getCode(), "bottom", cellStyle);
                            case "right":
                                JSONArray right = borders.getJSONArray("right");
                                tracingBorder(BorderStyle.valueOf(right.get(0).toString().toUpperCase()).getCode(), "right", cellStyle);
                        }
                    }
                }

                if (jsonObject4.containsKey("font") || jsonObject4.containsKey("underline") || jsonObject4.containsKey("strike") || jsonObject4.containsKey("color")) {
                    XSSFFont xSSFFont = workbook.createFont();

                    //------------------------------font--------------------------
                    JSONObject fontObj = (JSONObject) jsonObject4.get("font");
                    Object object1 = jsonObject4.get("underline");
                    Object object2 = jsonObject4.get("strike");
                    if (null != fontObj) {
                        if (fontObj.containsKey("name")) {
                            xSSFFont.setFontName(fontObj.getString("name"));
                        }
                        if (fontObj.containsKey("italic")) {
                            xSSFFont.setItalic(true);
                        }
                        if (fontObj.containsKey("size")) {
                            xSSFFont.setFontHeightInPoints(fontObj.getShort("size").shortValue());
                        }
                        if (fontObj.containsKey("bold")) {
                            boolean bool = fontObj.getBoolean("bold").booleanValue();
                            xSSFFont.setBold(bool);
                        }
                    }

                    if (null != object1) {
                        xSSFFont.setUnderline((byte) 1);
                    }
                    if (null != object2) {
                        xSSFFont.setStrikeout(true);
                    }

                    //------------------------------color--------------------------
                    if (jsonObject4.containsKey("color")) {
                        String colorStr = jsonObject4.getString("color");
                        XSSFColor xssfColor = new XSSFColor();

                        if (colorStr.length() > 6) {
                            if (colorStr.contains("rgb")) {
                                colorStr = colorStr.replace("rgb", "").replace("(", "").replace(")", "");
                                String[] arrayOfString = colorStr.split(",");
                                if (arrayOfString.length == 3) {
                                    byte[] arrayOfByte = {(byte) Integer.parseInt(arrayOfString[0]), (byte) Integer.parseInt(arrayOfString[1]), (byte) Integer.parseInt(arrayOfString[2])};
                                    xssfColor.setRGB(arrayOfByte);
                                }
                            } else if (colorStr.contains("#")) {
                                byte[] arrayOfByte = {(byte) Integer.parseInt(colorStr.substring(1, 3), 16), (byte) Integer.parseInt(colorStr.substring(3, 5), 16), (byte) Integer.parseInt(colorStr.substring(5, 7), 16)};
                                xssfColor.setRGB(arrayOfByte);
                            }
                        }
                        xSSFFont.setColor(xssfColor);
                    }
                    cellStyle.setFont(xSSFFont);

                }
                cellStyle.setWrapText(true);
                cell.setCellStyle((cellStyle));

            }


        }
    }


    /**
     * @param borderCode BordetStyle 枚举值
     * @param border     top、right、bottom 、left
     * @param cellStyle
     */
    public static void tracingBorder(int borderCode, String border, XSSFCellStyle cellStyle) {

        switch (borderCode) {
            case 0:
                switch (border) {
                    case "top":
                        cellStyle.setBorderTop(BorderStyle.NONE);
                        break;
                    case "left":
                        cellStyle.setBorderLeft(BorderStyle.NONE);
                        break;
                    case "bottom":
                        cellStyle.setBorderBottom(BorderStyle.NONE);
                        break;
                    case "right":
                        cellStyle.setBorderRight(BorderStyle.NONE);
                        break;
                    default:
                        break;
                }
                break;
            case 1:
                switch (border) {
                    case "top":
                        cellStyle.setBorderTop(BorderStyle.THIN);
                        break;
                    case "left":
                        cellStyle.setBorderLeft(BorderStyle.THIN);
                        break;
                    case "bottom":
                        cellStyle.setBorderBottom(BorderStyle.THIN);
                        break;
                    case "right":
                        cellStyle.setBorderRight(BorderStyle.THIN);
                        break;
                    default:
                        break;
                }
                break;
            case 2:
                switch (border) {
                    case "top":
                        cellStyle.setBorderTop(BorderStyle.MEDIUM);
                        break;
                    case "left":
                        cellStyle.setBorderLeft(BorderStyle.MEDIUM);
                        break;
                    case "bottom":
                        cellStyle.setBorderBottom(BorderStyle.MEDIUM);
                        break;
                    case "right":
                        cellStyle.setBorderRight(BorderStyle.MEDIUM);
                        break;
                    default:
                        break;
                }
                break;
            case 3:
                switch (border) {
                    case "top":
                        cellStyle.setBorderTop(BorderStyle.DASHED);
                        break;
                    case "left":
                        cellStyle.setBorderLeft(BorderStyle.DASHED);
                        break;
                    case "bottom":
                        cellStyle.setBorderBottom(BorderStyle.DASHED);
                        break;
                    case "right":
                        cellStyle.setBorderRight(BorderStyle.DASHED);
                        break;
                    default:
                        break;
                }
                break;
            case 4:
                cellStyle.setBorderBottom(BorderStyle.DOTTED);
                break;
            case 5:
                cellStyle.setBorderBottom(BorderStyle.THICK);
                break;
            case 6:
                cellStyle.setBorderBottom(BorderStyle.DOUBLE);
                break;
            case 7:
                cellStyle.setBorderBottom(BorderStyle.HAIR);
                break;
            case 8:
                cellStyle.setBorderBottom(BorderStyle.MEDIUM_DASHED);
                break;
            case 9:
                cellStyle.setBorderBottom(BorderStyle.DASH_DOT);
                break;
            case 10:
                cellStyle.setBorderBottom(BorderStyle.MEDIUM_DASH_DOT);
                break;
            case 11:
                cellStyle.setBorderBottom(BorderStyle.DASH_DOT_DOT);
                break;
            case 12:
                cellStyle.setBorderBottom(BorderStyle.MEDIUM_DASH_DOT_DOT);
                break;
            case 13:
                cellStyle.setBorderBottom(BorderStyle.SLANTED_DASH_DOT);
                break;
            default:
                break;
        }
    }

    /**
     * 导出excel生成图片
     * @param photos    图片数组
     * @param workbook
     * @param sheet
     * @throws Exception
     */
    public static void makePhoto(JSONArray photos, Workbook workbook, XSSFSheet sheet) throws Exception {
        ByteArrayOutputStream byteArrayOut = null;
        for (int i = 0; i < photos.size(); i++) {
            JSONObject qrCodeJson = (JSONObject) photos.get(i);

            if(qrCodeJson.get("type").toString().equals("QRCode")){
                // 二维码
                byteArrayOut = QrCodeOrBarCodeUtil.encodeQRCode
                        (qrCodeJson.getString("content"),  "", qrCodeJson.getInteger("width"), qrCodeJson.getInteger("height"));

            }else if(qrCodeJson.get("type").toString().equals("BarCode")){
                // 条形码
                byteArrayOut = QrCodeOrBarCodeUtil.encodeBarCode
                        (qrCodeJson.getString("content"),  qrCodeJson.getInteger("width"), qrCodeJson.getInteger("height"));

            }

            XSSFRow row = null;
            if(sheet.getRow(qrCodeJson.getInteger("ri")) == null){
                row = sheet.createRow(qrCodeJson.getInteger("ri"));
                row.setHeight((short) 360);
            } else {
                row = sheet.getRow(qrCodeJson.getInteger("ri"));
            }

            // 原图片宽高。
            double imageWidth = qrCodeJson.getInteger("width");
            double imageHeight = qrCodeJson.getInteger("height");

            // 列宽像素
            double cellWidth = sheet.getColumnWidthInPixels(qrCodeJson.getInteger("ci"));
            // getHeightInPoints()方法获取的是点（磅），就是excel设置的行高，1英寸有72磅，一般显示屏一英寸是96个像素: 行高像素
            double cellHeight = row.getHeightInPoints() / 72 * 96;

            // 图片宽 / 列宽
            double cellWidthD = imageWidth / cellWidth;
            int cellWidthI= (int) cellWidthD;

            // 图片高 / 列高
            double rowHeightD = imageHeight / cellHeight;
            int rowHeightDI = (int) rowHeightD;
            //  1023、255 为宽高  此从第r行、c列开始 、、、 扩充到 r+rowHeightDI行、c+cellWidthI列
//            XSSFClientAnchor anchor = new XSSFClientAnchor
//                    (0,0,1025,255,
//                            qrCodeJson.getInteger("ci"),
//                            row.getRowNum(),
//                            qrCodeJson.getInteger("ci")+ (cellWidthI == 0 ? 1 : cellWidthI),
//                            row.getRowNum() + (rowHeightDI == 0 ? 1 : rowHeightDI));
//            anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
//            //画图器    一个sheet只能一个
            XSSFDrawing drawing = sheet.createDrawingPatriarch();
//            drawing.createPicture(anchor , workbook.addPicture(byteArrayOut.toByteArray() , XSSFWorkbook.PICTURE_TYPE_PNG));


            CreationHelper helper = workbook.getCreationHelper();
            int jdpictureIdx = workbook.addPicture(byteArrayOut.toByteArray(), Workbook.PICTURE_TYPE_JPEG);// 根据需要调整参数，如果是PNG，就改为 Workbook.PICTURE_TYPE_PNG
            // 插入图片，如果原图宽度大于最终要求的图片宽度，就按比例缩小，否则展示原图
            ClientAnchor jdanchor = helper.createClientAnchor();
            // 起始画图的行列。
            jdanchor.setCol1(qrCodeJson.getInteger("ci"));
            jdanchor.setRow1(row.getRowNum());
            Picture pict = drawing.createPicture(jdanchor, jdpictureIdx);
            pict.resize();
        }
    }
}
