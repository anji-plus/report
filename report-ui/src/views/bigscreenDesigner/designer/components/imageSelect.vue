<template>
  <div>
    <el-input
      clearable
      v-model.trim="ImgUrl"
      size="mini"
      @change="changeInput"
    >
      <template slot="append">
        <i class="iconfont iconfolder-o" @click="openFileDialog"></i>
      </template>
    </el-input>
    <!-- 将弹窗移到外层，并添加必要的属性 -->
    <el-dialog
      title="图片选择"
      width="60%"
      :close-on-click-modal="false"
      :visible.sync="isShow"
      :before-close="closeDialog"
      :append-to-body="true"
      :modal-append-to-body="true"
      custom-class="image-select-dialog"
    >
      <div v-if="isShow">
        <div style="margin-bottom: 20px">
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
              icon="el-icon-upload"
              v-permission="'fileManage:upload'"
            >文件上传</el-button>
          </el-upload>
          <el-button type="primary" @click="submitSelect">提交</el-button>
          <el-button @click="closeDialog">取消</el-button>
        </div>

        <div class="main_part">
          <div class="page_main">
            <el-table
              ref="tables"
              class="elTable"
              :data="records"
              border
              highlight-current-row
              @row-dblclick="handleSelectionDblclick"
              @current-change="handleCurrentRowChange"
            >

              <el-table-column label="序号" width="80" align="center">
                <template slot-scope="scope">
                  {{ (queryParams.pageNumber - 1) * queryParams.pageSize + scope.$index + 1 }}
                </template>
              </el-table-column>

              <template v-for="(item, index) in option.columns">
                <el-table-column
                  v-if="item.tableHide != true && item.columnType != 'expand'"
                  :key="index"
                  :prop="item.field"
                  :label="item.label"
                  :min-width="item.minWidth || 110"
                  align="center"
                >
                  <template slot-scope="scope">
                    <div v-if="item.columnType === 'imgPreview'">
                      <el-image
                        style="width: 120px; height: 80px"
                        fit="contain"
                        :src="scope.row[item.field]"
                        :preview-src-list="[scope.row[item.field]]"
                      />
                    </div>
                    <span v-else>{{ scope.row[item.field] }}</span>
                  </template>
                </el-table-column>
              </template>
            </el-table>

            <div class="pagination">
              <el-pagination
                v-show="total > 0"
                background
                :current-page.sync="queryParams.pageNumber"
                :page-sizes="[10, 20, 30, 50]"
                :page-size="queryParams.pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total"
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
              />
            </div>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
import {fileAdd, fileDetail, fileList, fileUpdate} from "@/api/file";
const baseURL  = process.env.BASE_API;
export default {
  components: {

  },
  watch: {
    value: {
      handler(val) {
        this.ImgUrl = val || '';  // 添加这个 watch
      },
      immediate: true  // 确保组件创建时就执行
    }
  },
  model: {
    prop: "value",
    event: "input"
  },
  props: {
    value: {
      type: "",
      default: ""
    }
  },
  data() {
    return {
      ImgUrl: "",
      isShow: false,
      uploadUrl: baseURL + "/file/upload",
      // 查询表单提交的值
      queryParams: {
        showMoreSearch: false, // 是否展开更多搜索条件
        pageNumber: 1,
        pageSize: 10,
        order: "",
        sort: ""
      },
      currentRow: null, // 表格中当前选中的记录
      highlightRowStyle: null,
      records: [], // 接口返回的记录列表
      total: 0 ,   // 接口返回的总条数
      rowIdList: [],
      option: {
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
          },
          {
            // 以下为表格的配置
            label: "图片缩略图", // 列名称，必填
            field: "urlPath", // 字段名，必填
            columnType: "imgPreview", // 图片     不设置默认text
          }
        ]
      },
      selectedId: '', // 用于radio选中
    };
  },
  created() {
    this.ImgUrl = this.value;
  },
  computed: {
    headers() {
      return {
        Authorization: getToken() // 直接从本地获取token就行
      };
    }
  },
  methods: {
    openFileDialog(){
      this.isShow = true;
      this.handleQueryPageList();
    },
    // 页码改变
    handleCurrentChange(pageNumber) {
      this.queryParams.pageNumber = pageNumber;
      this.handleQueryPageList();
    },
    // 每页size改变时
    handleSizeChange(val) {
      this.queryParams.pageNumber = 1;
      this.queryParams.pageSize = val;
      this.handleQueryPageList();
    },
    // 列表查询
    async handleQueryPageList() {
      // 将特殊参数值urlcode处理
      // 默认的排序
      if (
        this.isBlank(this.queryParams["order"]) &&
        this.isNotBlank(this.option.buttons.query.order)
      ) {
        this.queryParams["sort"] = this.option.buttons.query.sort;
        this.queryParams["order"] = this.option.buttons.query.order;
      }
      let params = this.urlEncodeObject(this.queryParams, "order,sort");
      const { data, code } = await this.option.buttons.query.api(params);
      if (code != "200") return;
      this.records = data.records;
      this.total = data.total;
    },
    // 上传成功的回调
    handleUpload(response, file, fileList) {
      // 触发查询按钮
      this.handleQueryPageList();
      //清除el-upload组件中的文件
      this.$refs.upload.clearFiles();
    },
    handleError() {
      this.$message({
        message: "上传失败！",
        type: "error"
      });
    },
    handleCurrentRowChange(currentRow) {
      this.currentRow = currentRow;
      this.selectedId = currentRow ? currentRow.id : '';
    },
    // 双击
    handleSelectionDblclick(row) {
      this.currentRow = row;
      this.submitSelect();
    },
    submitSelect() {
      console.log(this.headers);
      this.ImgUrl = this.currentRow.urlPath;
      this.$emit("input", this.currentRow.urlPath);
      this.$emit("change", this.currentRow.urlPath);
      this.closeDialog();
    },
    changeInput(e) {
      if (e) {
        this.ImgUrl = e;
      } else {
        this.ImgUrl = "";  // 直接设置为空字符串
      }
      this.$emit("input", this.ImgUrl);
      this.$emit("change", this.ImgUrl);
    },
    // 弹窗关闭之前需要执行的逻辑
    closeDialog() {
      this.records = [];
      this.total = 0;
      this.isShow = false;
      this.currentRow = null;
    },
  }
};
</script>

<style lang="scss">
.file {
  position: absolute;
  width: 100%;
  padding: 100%;
  right: 0;
  top: 0;
  opacity: 0;
}

:deep(.el-input-group__append),
:deep(.el-input-group__prepend) {
  padding: 0 10px !important;
  overflow: hidden;
}

.iconfont {
  font-size: 12px;
}

/* 弹窗样式 */
.el-dialog__wrapper {
  position: fixed !important;
  top: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  left: 0 !important;
  overflow: auto !important;
  margin: 0 !important;
  z-index: 2000 !important; /* 降低弹窗的 z-index */

  .el-dialog {
    margin: 0vh auto 0 !important;
    position: relative !important;
    top: 0 !important;
    transform: none !important;
    max-height: 90vh !important;

    .el-dialog__body {
      max-height: calc(90vh - 120px) !important;
      overflow-y: auto !important;
      padding: 20px !important;
    }
  }
}

/* 表格样式 */
.el-table__row.current-row {
  background-color: #409EFF !important;
  color: #fff !important;

  td {
    background-color: #409EFF !important;
    color: #fff !important;
  }
}

.pagination {
  text-align: right;
  margin-top: 20px;
}

/* 图片预览样式 */
:deep(.el-image-viewer__wrapper)  {
  z-index: 2100 !important; /* 确保图片预览在弹窗之上 */
}

/* 遮罩层样式 */
.v-modal {
  z-index: 1999 !important; /* 遮罩层在最下面 */
}
</style>
