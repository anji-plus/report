<!--
 * @Descripttion: 系统设置--文件管理
 * @version: 
 * @Author: Raod
 * @Date: 2021-8-4 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-03-09 09:57:17
-->
<template>
  <anji-crud ref="listPage" :option="crudOption">
    <template v-slot:tableButtons>
      <el-upload
        class="el-upload"
        ref="upload"
        :action="uploadUrl"
        :headers="headers"
        :on-success="handleUpload"
        :on-error="handleError"
        :show-file-list="false"
        :limit="1"
      >
        <el-button
          type="primary"
          icon="el-icon"
          v-permission="'fileManage:upload'"
          >文件上传</el-button
        >
      </el-upload>
    </template>
    <template slot="edit" slot-scope="props">
      <el-button type="text" @click="copyUrlPath(props)">复制url</el-button>
    </template>
    <template slot="rowButton" slot-scope="props">
      <el-button type="text" @click="customButtom(props)">下载</el-button>
    </template>
  </anji-crud>
</template>
<script>
import { fileList, fileAdd, fileDel, fileUpdate, fileDetail } from "@/api/file";
import { getToken } from "@/utils/auth";

export default {
  name: "File",
  components: {
    anjiCrud: require("@/components/AnjiPlus/anji-crud/anji-crud").default
  },
  data() {
    return {
      selectedList: [],
      uploadUrl: process.env.BASE_API + "/file/upload",
      crudOption: {
        // 使用菜单做为页面标题
        title: "文件管理",
        // 详情页中输入框左边文字宽度
        labelWidth: "120px",
        // 查询表单条件
        queryFormFields: [
          {
            inputType: "input",
            label: "文件路径",
            field: "filePath"
          }
        ],
        // 表头按钮
        tableButtons: [
          {
            label: "删除",
            type: "danger",
            permission: "fileManage:delete",
            icon: "el-icon-delete",
            plain: false,
            click: () => {
              return this.$refs.listPage.handleDeleteBatch();
            }
          }
        ],
        // 表格行按钮
        rowButtons: [
          {
            label: "复制url",
            click: this.copyUrlPath
          },
          {
            label: "下载",
            click: this.customButtom
          },
          {
            label: "删除",
            permission: "fileManage:delete",
            click: row => {
              return this.$refs.listPage.handleDeleteBatch(row);
            }
          }
        ],
        // 操作按钮
        buttons: {
          query: {
            api: fileList,
            permission: "fileManage:query",
            sort: "create_time",
            order: "DESC"
          },
          queryByPrimarykey: {
            api: fileDetail,
            permission: "fileManage:query"
          },
          add: {
            api: fileAdd,
            permission: "fileManage:upload",
            isShow: false
          },
          delete: {
            api: fileDel,
            permission: "fileManage:delete"
          },
          edit: {
            api: fileUpdate,
            permission: "fileManage:update",
            isShow: false
          },
          rowButtonsWidth: 150 // row自定义按钮表格宽度
        },
        // 表格列
        columns: [
          {
            label: "",
            field: "id",
            primaryKey: true, // 根据主键查询详情或者根据主键删除时, 主键的
            tableHide: true, // 表格中不显示
            editHide: true // 编辑弹框中不显示
          },
          {
            // 以下为表格的配置
            label: "图片缩略图", // 列名称，必填
            field: "urlPath", // 字段名，必填
            columnType: "imgPreview", // 图片     不设置默认text
            editHide: true, // 编辑弹框中不显示
            // 以下为编辑查看弹框的配置
            // inputType: 'input', // 编辑查看表单组件类型  input anji-select

            placeholder: "",
            disabled: false
          },
          {
            label: "文件标识", // 文件标识
            placeholder: "",
            field: "fileId",
            editField: "fileId",
            tableHide: true, // 表格中不显示
            inputType: "input",
            rules: [
              { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "文件类型", // 文件路径
            placeholder: "",
            field: "fileType",
            editField: "fileType",
            inputType: "input",
            rules: [
              {
                min: 1,
                max: 1024,
                message: "不超过1024个字符",
                trigger: "blur"
              }
            ],
            disabled: false
          },
          {
            label: "文件路径", // 文件路径
            placeholder: "",
            field: "filePath",
            editField: "filePath",
            inputType: "input",
            rules: [
              {
                min: 1,
                max: 1024,
                message: "不超过1024个字符",
                trigger: "blur"
              }
            ],
            disabled: false
          },
          {
            label: "url路径", // url路径
            placeholder: "",
            field: "urlPath",
            editField: "urlPath",
            inputType: "input",
            rules: [
              {
                min: 1,
                max: 1024,
                message: "不超过1024个字符",
                trigger: "blur"
              }
            ],
            disabled: false
          },
          {
            label: "内容说明", // 内容说明
            placeholder: "",
            field: "fileInstruction",
            editField: "fileInstruction",
            inputType: "input",
            rules: [
              {
                min: 1,
                max: 1024,
                message: "不超过1024个字符",
                trigger: "blur"
              }
            ],
            disabled: false
          },
          {
            label: "创建人",
            field: "createByView",
            columnType: "expand", // 表格中放在可展开行中
            inputType: "input", // 编辑和查看详情中显示的input
            disabled: true // 编辑和查看详情中不可编辑
          },
          {
            label: "创建时间",
            field: "createTime",
            columnType: "expand",
            inputType: "input",
            disabled: true
          }
        ]
      }
    };
  },
  computed: {
    headers() {
      return {
        Authorization: getToken() // 直接从本地获取token就行
      };
    }
  },

  methods: {
    // 上传成功的回调
    handleUpload(response, file, fileList) {
      // 触发查询按钮
      this.$refs.listPage.handleQueryForm();
      //清除el-upload组件中的文件
      this.$refs.upload.clearFiles();
    },
    handleError() {
      this.$message({
        message: "上传失败！",
        type: "error"
      });
    },
    downloadFile(row) {
      window.open(row.urlPath);
    },
    customButtom(val) {
      this.downloadFile(val);
    },
    copyUrlPath(val) {
      this.copyToClip(val.urlPath);
      this.$message({
        message: "已将url路径复制至剪切板！",
        type: "success"
      });
    },
    copyToClip(content, message) {
      let aux = document.createElement("input");
      aux.setAttribute("value", content);
      document.body.appendChild(aux);
      aux.select();
      document.execCommand("copy");
      document.body.removeChild(aux);
    }
  }
};
</script>
<style scoped lang="scss">
.el-upload {
  display: inline-block;
  margin-right: 20px;
}
</style>
