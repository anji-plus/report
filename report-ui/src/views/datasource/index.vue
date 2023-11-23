<!--
 * @Descripttion: 报表设计--数据源
 * @version: 
 * @Author: yanzili
 * @Date: 2021-12-11 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-03-09 09:43:31
-->
<template>
  <anji-crud ref="listPage" :option="crudOption">
    <template v-slot:pageSection>
      <EditDataSource
        ref="EditDataSource"
        :dataSource="dataSource"
        :visib="dialogVisibleSetDataSource"
        @handleClose="dialogVisibleSetDataSource = false"
        @refreshList="refreshList"
      />
    </template>
  </anji-crud>
</template>
<script>
import {
  reportDataSourceList,
  reportDataSourceAdd,
  reportDataSourceDeleteBatch,
  reportDataSourceUpdate,
  reportDataSourceDetail
} from "@/api/reportDataSource";
import EditDataSource from "./components/EditDataSource";
export default {
  name: "ReportDataSource",
  components: {
    EditDataSource: EditDataSource
  },
  data() {
    return {
      dialogVisibleSetDataSource: false,
      dataSource: {},
      crudOption: {
        // 使用菜单做为页面标题
        title: "数据源",
        // 详情页中输入框左边文字宽度
        labelWidth: "120px",
        // 表头按钮
        tableButtons: [
          {
            label: "新增",
            type: "", // primary、success、info、warning、danger
            permission: "datasourceManage:insert", // 按钮权限码
            icon: "el-icon-plus",
            plain: true,
            click: () => {
              return this.operateDatasource("add");
            }
          },
          {
            label: "删除",
            type: "danger",
            permission: "datasourceManage:delete",
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
            label: "编辑",
            permission: "datasourceManage:update",
            click: row => {
              return this.operateDatasource("edit", row);
            }
          },
          {
            label: "删除",
            permission: "datasourceManage:delete",
            click: row => {
              return this.$refs.listPage.handleDeleteBatch(row);
            }
          }
        ],
        // 查询表单条件
        queryFormFields: [
          {
            inputType: "input",
            label: "数据源编码",
            field: "sourceCode"
          },
          {
            inputType: "input",
            label: "数据源名称",
            field: "sourceName"
          },
          {
            inputType: "anji-select", //form表单类型 input|input-number|anji-select(传递url或者dictCode)|anji-tree(左侧树)|date|datetime|datetimerange
            anjiSelectOption: {
              dictCode: "SOURCE_TYPE"
            },
            label: "数据源类型",
            field: "sourceType"
          }
        ],
        // 操作按钮
        buttons: {
          rowButtonsWidth: 150, // row自定义按钮表格宽度
          query: {
            api: reportDataSourceList,
            permission: "datasourceManage:query",
            sort: "update_time",
            order: "DESC"
          },
          queryByPrimarykey: {
            api: reportDataSourceDetail,
            permission: "datasourceManage:detail"
          },
          add: {
            api: reportDataSourceAdd,
            permission: "datasourceManage:insert",
            isShow: false
          },
          delete: {
            api: reportDataSourceDeleteBatch,
            permission: "datasourceManage:delete"
          },
          edit: {
            api: reportDataSourceUpdate,
            permission: "datasourceManage:update",
            isShow: false
          }
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
            label: "数据源编码", //数据源编码
            placeholder: "",
            field: "sourceCode",
            editField: "sourceCode",
            inputType: "input",
            rules: [
              { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "数据源名称", //数据源名称
            placeholder: "",
            field: "sourceName",
            editField: "sourceName",
            inputType: "input",
            rules: [
              { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "数据源描述", //数据源描述
            placeholder: "",
            field: "sourceDesc",
            editField: "sourceDesc",
            inputType: "input",
            rules: [
              { min: 1, max: 255, message: "不超过255个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "数据源类型", //数据源类型 DIC_NAME=SOURCE_TYPE; mysql，orace，sqlserver，elasticsearch，接口，javaBean，数据源类型字典中item-extend动态生成表单
            placeholder: "",
            field: "sourceType",
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("SOURCE_TYPE", row["sourceType"]);
            },
            editField: "sourceType",
            inputType: "input",
            rules: [
              { min: 1, max: 50, message: "不超过50个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "数据源连接配置json", //数据源连接配置json：关系库{ jdbcUrl:'', username:'', password:'' } ES{ hostList:'ip1:9300,ip2:9300,ip3:9300', clusterName:'elasticsearch_cluster' }  接口{ apiUrl:'http://ip:port/url', method:'' } javaBean{ beanNamw:'xxx' }
            placeholder: "",
            field: "sourceConfig",
            editField: "sourceConfig",
            tableHide: true,
            inputType: "input",
            rules: [
              {
                min: 1,
                max: 2048,
                message: "不超过2048个字符",
                trigger: "blur"
              }
            ],
            disabled: false
          },
          {
            label: "状态", //0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG
            placeholder: "",
            field: "enableFlag",
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("ENABLE_FLAG", row["enableFlag"]);
            },
            colorStyle: {
              0: "table-danger", //key为editField渲染的值（字典的提交值）'红色': 'danger','蓝色': 'primary','绿色': 'success','黄色': 'warning','灰色': 'info','白色'：''
              1: "table-success"
            },
            editField: "enableFlag",
            inputType: "input",
            rules: [],
            disabled: false
          },
          {
            label: "删除标记", //0--未删除 1--已删除 DIC_NAME=DELETE_FLAG
            placeholder: "",
            field: "deleteFlag",
            editField: "deleteFlag",
            tableHide: true,
            inputType: "input",
            rules: [],
            disabled: false
          }
        ]
      }
    };
  },
  methods: {
    operateDatasource(type, prop) {
      this.dialogVisibleSetDataSource = true;
      if (prop) {
        this.dataSource = prop;
      } else {
        this.dataSource = {};
      }
      this.$refs.EditDataSource.getSystem();
    },
    refreshList() {
      this.$refs.listPage.handleQueryForm("query");
    }
  }
};
</script>
