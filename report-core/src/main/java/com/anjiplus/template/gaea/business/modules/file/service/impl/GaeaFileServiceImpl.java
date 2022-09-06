package com.anjiplus.template.gaea.business.modules.file.service.impl;

import com.anji.plus.gaea.constant.BaseOperationEnum;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.exception.BusinessException;
import com.anji.plus.gaea.exception.BusinessExceptionBuilder;
import com.anji.plus.gaea.oss.exceptions.GaeaOSSException;
import com.anji.plus.gaea.oss.exceptions.GaeaOSSTypeLimitedException;
import com.anji.plus.gaea.oss.ossbuilder.GaeaOSSTemplate;
import com.anji.plus.gaea.oss.utils.ResponseUtil;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.anjiplus.template.gaea.business.modules.file.dao.GaeaFileMapper;
import com.anjiplus.template.gaea.business.modules.file.entity.GaeaFile;
import com.anjiplus.template.gaea.business.modules.file.service.GaeaFileService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.entity.ContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.UUID;

/**
 * 文件管理服务实现
 * @author: Raod
 * @since: 2022-08-31
 */
@Service
@Slf4j
@RefreshScope
public class GaeaFileServiceImpl implements GaeaFileService {

    @Value("${spring.gaea.subscribes.oss.downloadPath:''}")
    private String fileDownloadPath;

    @Autowired
    private GaeaOSSTemplate gaeaOSSTemplate;

    @Autowired
    private GaeaFileMapper gaeaFileMapper;

    @Override
    public GaeaBaseMapper<GaeaFile> getMapper() {
        return gaeaFileMapper;
    }

    /**
     * 文件上传
     *
     * @param multipartFile 文件
     * @return
     */
    @Override
    public GaeaFile upload(MultipartFile multipartFile) {
        String originalFilename =  multipartFile.getOriginalFilename();

        if (StringUtils.isBlank(originalFilename)) {
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_EMPTY_FILENAME);
        }
        // 文件后缀 .png
        String suffixName = originalFilename.substring(originalFilename.lastIndexOf("."));
        // 生成文件唯一性标识
        String fileId = UUID.randomUUID().toString();

        // 生成在oss中存储的文件名 402b6193e70e40a9bf5b73a78ea1e8ab.png
        String fileObjectName = fileId + suffixName;
        // 生成链接通过fileId http访问路径 http://10.108.3.121:9089/meta/file/download/402b6193e70e40a9bf5b73a78ea1e8ab
        String urlPath = fileDownloadPath + "/" + fileId;

        // 上传文件
        try{
            gaeaOSSTemplate.uploadFileByInputStream(multipartFile, fileObjectName);
        }catch (GaeaOSSTypeLimitedException e){
            log.error("上传失败GaeaOSSTypeLimitedException", e);
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_SUFFIX_UNSUPPORTED, e.getMessage());
        }catch (GaeaOSSException e){
            log.error("上传失败GaeaOSSException", e);
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_UPLOAD_ERROR, e.getMessage());
        }

        // 保存到文件管理中
        GaeaFile gaeaFile = new GaeaFile();
        gaeaFile.setFileId(fileId);
        gaeaFile.setFilePath(fileObjectName);
        gaeaFile.setUrlPath(urlPath);
        gaeaFile.setFileType(suffixName.replace(".", ""));
        gaeaFile.setFileInstruction(originalFilename);
        insert(gaeaFile);

        return gaeaFile;
    }

    private MultipartFile getMultipartFile(File file){
        FileInputStream fileInputStream;
        MultipartFile multipartFile;
        try {
            fileInputStream = new FileInputStream(file);
            multipartFile = new MockMultipartFile(file.getName(),file.getName(),
                    ContentType.APPLICATION_OCTET_STREAM.toString(),fileInputStream);
        } catch (Exception e) {
            log.error("file转MultipartFile失败", e);
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_OPERATION_FAILED, e.getMessage());
        }
        return multipartFile;
    }

    /**
     * 文件上传
     *
     * @param file           文件
     * @return
     */
    @Override
    public GaeaFile upload(File file) {
        return upload(getMultipartFile(file));
    }

    @Override
    public ResponseEntity<byte[]> download(HttpServletRequest request, HttpServletResponse response, String fileId) {
        try {
            // fileId必填
            if(StringUtils.isBlank(fileId)){
                throw BusinessExceptionBuilder.build(ResponseCode.FILE_ONT_EXSIT);
            }
            // 根据fileId，从gaea_file中读出filePath
            LambdaQueryWrapper<GaeaFile> queryWrapper = Wrappers.lambdaQuery();
            queryWrapper.eq(GaeaFile::getFileId, fileId);
            GaeaFile gaeaFile = gaeaFileMapper.selectOne(queryWrapper);
            if (null == gaeaFile) {
                throw BusinessExceptionBuilder.build(ResponseCode.FILE_ONT_EXSIT);
            }

            String userAgent = request.getHeader("User-Agent");
            boolean isIEBrowser = userAgent.indexOf("MSIE") > 0;
            // 在oss中存储的文件名 402b6193e70e40a9bf5b73a78ea1e8ab.png
            String fileObjectName = gaeaFile.getFileId().concat(".").concat(gaeaFile.getFileType());
            String originalFilename = gaeaFile.getFileInstruction();
            if (StringUtils.isBlank(fileObjectName) || StringUtils.isBlank(originalFilename)) {
                throw BusinessExceptionBuilder.build(ResponseCode.FILE_ONT_EXSIT);
            }
            if (!originalFilename.endsWith(".".concat(gaeaFile.getFileType()))) {
                originalFilename = originalFilename.concat(".").concat(gaeaFile.getFileType());
            }

            // 调用文件存储工厂，读取文件，返回字节数组
            byte[] fileBytes = gaeaOSSTemplate.downloadFile(fileObjectName);

            // 根据文件后缀来判断，是显示图片\视频\音频，还是下载文件
            return ResponseUtil.writeBody(originalFilename, fileBytes, isIEBrowser);
        } catch (Exception e) {
            log.error("file download error", e);
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_OPERATION_FAILED, e.getMessage());
        }
    }

    /**
     * 获取文件
     *
     * @param fileId
     * @return
     */
    @Override
    public byte[] getFile(String fileId) {
        // fileId必填
        if(StringUtils.isBlank(fileId)){
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_ONT_EXSIT);
        }
        // 根据fileId，从gaea_file中读出filePath
        LambdaQueryWrapper<GaeaFile> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(GaeaFile::getFileId, fileId);
        GaeaFile gaeaFile = gaeaFileMapper.selectOne(queryWrapper);
        if (null == gaeaFile) {
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_ONT_EXSIT);
        }

        // 在oss中存储的文件名 402b6193e70e40a9bf5b73a78ea1e8ab.png
        String fileObjectName = gaeaFile.getFileId().concat(".").concat(gaeaFile.getFileType());
        String originalFilename = gaeaFile.getFileInstruction();
        if (StringUtils.isBlank(fileObjectName) || StringUtils.isBlank(originalFilename)) {
            throw BusinessExceptionBuilder.build(ResponseCode.FILE_ONT_EXSIT);
        }

        // 调用文件存储工厂，读取文件，返回字节数组
        return gaeaOSSTemplate.downloadFile(fileObjectName);
    }

    /**
     * 批处理操作后续处理
     * 删除本地已经存在的文件
     *
     * @param entities
     * @param operationEnum 操作类型
     * @throws BusinessException 阻止程序继续执行或回滚事务
     */
    @Override
    public void processBatchAfterOperation(List<GaeaFile> entities, BaseOperationEnum operationEnum) throws BusinessException {
        if (operationEnum.equals(BaseOperationEnum.DELETE_BATCH)) {
            // 删除本地文件
            entities.forEach(gaeaFile -> gaeaOSSTemplate.deleteFile(gaeaFile.getFileId().concat(".").concat(gaeaFile.getFileType())));
        }

    }
}
