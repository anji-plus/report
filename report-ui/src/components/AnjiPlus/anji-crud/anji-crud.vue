<!--
 * @Descripttion: 增删改查列表查询组件
 * @Author: Devli
 * @Date: 2021-7-17 10:42:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-3-9 10:04:24
 !-->
<template>
  <div :class="[hasTreeFieldInQueryForm ? 'page-container' : 'app-container']">
    <div v-if="hasTreeFieldInQueryForm" class="left-container">
      <AnjiTree
        ref="queryFormTree"
        v-model.trim="queryParams[queryFormTreeField.field]"
        :is-open="queryFormTreeField.anjiTreeOption.isOpen"
        :enable-filter="queryFormTreeField.anjiTreeOption.enableFilter"
        :label-name="queryFormTreeField.label"
        :url="queryFormTreeField.anjiTreeOption.url"
        @node-click="handleTreeNodeCheck"
      />
    </div>
    <div class="right-container">
      <div class="top_part">
        <!-- 查询表单开始 -->
        <el-form
          v-if="queryFormTreeHide == false"
          ref="formSearch"
          :model="queryParams"
          label-width="100px"
          style="border-bottom: 1px solid #dbdde3; margin-bottom: 10px"
        >
          <div class="screenFlex">
            <div class="searchFormFlex">
              <el-row>
                <template v-for="(item, index) in queryFormFieldExcludeTree">
                  <el-col
                    v-if="index < 3 || queryParams.showMoreSearch"
                    :key="item.field"
                    :span="8"
                  >
                    <el-form-item
                      :label="item.label"
                      :rules="item.rules"
                      :prop="item.field"
                    >
                      <!-- 输入框 -->
                      <el-input
                        v-if="
                          item.inputType == 'input' ||
                            item.inputType == 'input-number'
                        "
                        v-model.trim="queryParams[item.field]"
                        :placeholder="item.placeholder || '请输入'"
                        :clearable="item.clearable !== false"
                        :disabled="item.disabled"
                        @change="value => queryFormChange(item.field, value)"
                      />
                      <!-- 开关 -->
                      <el-switch
                        v-else-if="item.inputType == 'switch'"
                        v-model.trim="queryParams[item.field]"
                        :disabled="item.disabled"
                        :active-value="item.switchOption.disableValue"
                        :inactive-value="item.switchOption.enableValue"
                        active-color="#5887fb"
                        inactive-color="#ccc"
                        @change="value => queryFormChange(item.field, value)"
                      />
                      <!-- 下拉框 -->
                      <anji-select
                        v-else-if="item.inputType == 'anji-select'"
                        v-model.trim="queryParams[item.field]"
                        :multiple="item.anjiSelectOption.multiple"
                        :dict-code="item.anjiSelectOption.dictCode"
                        :url="item.anjiSelectOption.url"
                        :method="item.anjiSelectOption.method"
                        :query-param="item.anjiSelectOption.queryParam"
                        :option="item.anjiSelectOption.option"
                        :label="item.anjiSelectOption.label"
                        :disabled-options="
                          item.anjiSelectOption.disabledOptions
                        "
                        :disabled="item.disabled"
                        :merge-label="item.anjiSelectOption.mergeLabel"
                        :local-options="item.anjiSelectOption.localOptions"
                        @change="value => queryFormChange(item.field, value)"
                      />
                      <!-- 日期时间框  -->
                      <el-date-picker
                        v-else-if="item.inputType.indexOf('date') >= 0"
                        v-model="queryParams[item.field]"
                        style="width: 100%"
                        :placeholder="item.placeholder || '请选择'"
                        :type="item.inputType"
                        :format="item.format"
                        :value-format="item.valueFormat"
                        :clearable="item.clearable !== false"
                        @change="value => queryFormChange(item.field, value)"
                      />
                      <anji-cascader
                        v-else-if="item.inputType == 'anji-cascader'"
                        v-model.trim="queryParams[item.field]"
                        :disabled="item.disabled"
                        :single-display="item.anjiCascader.singleDisplay"
                        :url="item.anjiCascader.url"
                        @change="
                          value => queryFormChange(item.field, value, null)
                        "
                      />
                      <!-- 待扩展的表单类型，请自行扩展 -->
                      <el-input
                        v-else
                        placeholder="组件不支持此类型表单请至组件内部自行扩展"
                        disabled
                      />
                    </el-form-item>
                  </el-col>
                </template>
              </el-row>
            </div>

            <div class="screenButtons">
              <el-button
                v-if="queryFormFieldExcludeTree.length > 3"
                class="button"
                size="mini"
                plain
                @click="handleToggleMoreSearch"
              >
                <i
                  :class="
                    queryParams.showMoreSearch
                      ? 'el-icon-arrow-up'
                      : 'el-icon-arrow-down'
                  "
                />
                {{ queryParams.showMoreSearch == true ? "展开" : "收起" }}
              </el-button>
              <el-button
                class="button"
                size="mini"
                plain
                @click="handleResetForm()"
                >重置</el-button
              >
              <el-button
                class="button"
                size="mini"
                type="primary"
                @click="handleQueryForm('query')"
                >查询</el-button
              >
            </div>
          </div>
        </el-form>
        <!-- 查询表单结束 -->
        <!-- 批量操作 -->
        <div style="padding-bottom: 8px">
          <slot name="tableButtons" :selection="checkRecords" />
          <el-button
            v-for="(item, index) in option.tableButtons"
            :key="index"
            v-permission="item.permission"
            class="tableButton"
            :plain="item.plain"
            :icon="item.icon"
            :type="item.type"
            :disabled="isDisabledButton(item, checkRecords)"
            @click="item.click(checkRecords)"
            >{{ handlegetLable(checkRecords, item.label) }}</el-button
          >
        </div>
      </div>

      <!-- 表格开始 -->
      <div class="main_part">
        <div class="page_main">
          <el-table
            ref="tables"
            class="elTable"
            align="center"
            :data="records"
            :row-class-name="tableRowClassName"
            border
            @selection-change="handleSelectionChange"
            @sort-change="handleSortChange"
            @row-dblclick="handleSelectionDblclick"
            @row-contextmenu="rowContextMenu"
          >
            <!--多选-->
            <el-table-column fixed type="selection" width="50" align="center" />
            <!--隐藏列-->
            <el-table-column v-if="tableExpandColumns.length > 0" type="expand">
              <template slot-scope="scope">
                <p
                  v-for="item in tableExpandColumns"
                  :key="item.field"
                  class="table-expand-item"
                >
                  <span class="titel"> {{ item.label }}: </span>
                  <span>{{ scope.row[item.field] }}</span>
                </p>
              </template>
            </el-table-column>
            <!--序号-->
            <el-table-column label="序号" min-width="50" align="center">
              <template slot-scope="scope">
                {{
                  queryParams.pageSize * (queryParams.pageNumber - 1) +
                    scope.$index +
                    1
                }}
              </template>
            </el-table-column>

            <template v-for="(item, index) in option.columns">
              <el-table-column
                v-if="item.tableHide != true && item.columnType != 'expand'"
                :key="index"
                :prop="item.field"
                :label="fieldLabel(item)"
                :min-width="item.minWidth || 110"
                :sortable="item.sortable"
                :show-overflow-tooltip="true"
                align="center"
              >
                <template slot-scope="scope">
                  <div v-if="item.columnType == 'imgPreview'">
                    <!-- 图片缩略图-->
                    <el-image
                      style="width: 25%; height: 50%"
                      fit="contain"
                      :src="scope.row[item.field]"
                      :preview-src-list="[scope.row[item.field]]"
                    />
                  </div>
                  <div v-else>
                    <span v-if="item.inputType == 'switch' && !item.colorStyle">
                      <el-switch
                        v-model.trim="scope.row[item.field]"
                        :active-value="1"
                        :inactive-value="0"
                        active-color="#5887fb"
                        inactive-color="#ccc"
                        @change="switchChange(scope.row, item.switchOption)"
                      />
                    </span>
                    <!-- 带单位 -->
                    <span v-else-if="item.inputType == 'anji-input'">{{
                      fieldValueByAnjiInput(scope.row[item.field], item)
                    }}</span>
                    <!--表格 a 合并 b上-->
                    <span v-else-if="item.mergeColumn"
                      >{{ scope.row[item.field] }}({{
                        scope.row[item.mergeColumn]
                      }})</span
                    >
                    <!-- 没有单位 -->
                    <span
                      v-else-if="item.colorStyle"
                      :class="item.colorStyle[scope.row[item.editField]]"
                      >{{ fieldValueByRowRenderer(scope.row, item) }}</span
                    >
                    <span v-else>{{
                      fieldValueByRowRenderer(scope.row, item)
                    }}</span>
                  </div>
                </template>
              </el-table-column>
            </template>
            <!--操作栏-->
            <el-table-column
              align="center"
              fixed="right"
              label="操作"
              :width="option.buttons.rowButtonsWidth || 100"
            >
              <template slot-scope="scope">
                <div v-if="option.rowButtons.length <= 2">
                  <template v-for="(item, index) in option.rowButtons">
                    <el-button
                      v-if="isHide(item, scope.row)"
                      :key="index"
                      v-permission="item.permission"
                      :disabled="isDisabledButton(item, scope.row)"
                      :type="item.type || 'text'"
                      size="small"
                      @click="item.click(scope.row)"
                    >{{ handlegetLable(scope.row, item.label) }}</el-button
                    >
                  </template>

                </div>
                <div v-else>
                  <el-button
                    v-permission="option.rowButtons[0].permission"
                    :type="option.rowButtons[0].type || 'text'"
                    :disabled="
                      isDisabledButton(option.rowButtons[0], scope.row)
                    "
                    @click="option.rowButtons[0].click(scope.row)"
                    >{{
                      handlegetLable(scope.row, option.rowButtons[0].label)
                    }}</el-button
                  >
                  <el-dropdown trigger="click">
                    <span class="el-dropdown-link">
                      更多
                      <i class="el-icon-caret-bottom el-icon--right" />
                    </span>
                    <el-dropdown-menu slot="dropdown">
                      <el-dropdown-item class="clearfix">
                        <template v-for="(item, index) in option.rowButtons.filter(
                            (el, index) => index > 0
                          )">
                          <el-button
                            v-if="isHide(item, scope.row)"
                            :key="index"
                            v-permission="item.permission"
                            :type="item.type || 'text'"
                            :disabled="isDisabledButton(item, scope.row)"
                            size="small"
                            @click="item.click(scope.row)"
                          >{{
                              handlegetLable(scope.row, item.label)
                            }}</el-button
                          >
                        </template>
                      </el-dropdown-item>
                    </el-dropdown-menu>
                  </el-dropdown>
                </div>
              </template>
            </el-table-column>
          </el-table>
          <div class="page_bottom">
            <div class="pagination">
              <div>
                <slot name="tableSelectionBtn" :selection="checkRecords" />
              </div>
              <el-pagination
                v-show="total > 0"
                background
                :current-page.sync="queryParams.pageNumber"
                :page-sizes="$pageSizeAll"
                :page-size="queryParams.pageSize"
                layout="total, prev, pager, next, jumper, sizes"
                :total="total"
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
              />
            </div>
          </div>
        </div>
      </div>
      <!-- 表格结束 -->
      <EditDialog
        ref="edit"
        :submit-detail-data="option.submitDetailData"
        :handle-detail-data="option.handleDetailData"
        :option="option"
        :model-type="editDialogModelType"
        :visible="editDialogOpen"
        :row-data="editDialogRowData"
        @closeEvent="editDialogClosedEvent"
      >
        <template v-slot:customCard>
          <slot name="cardInEditPage" />
        </template>
        <template slot="editBtn" slot-scope="scope">
          <slot name="editBtnPage" :rowData="scope" />
        </template>
      </EditDialog>
    </div>
    <slot name="pageSection" />
    <!-- 右键菜单 -->
    <anji-contextMenu
      :visible.sync="isShowRowContextMenu"
      :style-obj="contextMenuConfigStyle"
    >
      <div
        v-for="(item, index) in option.contextMenu"
        :key="index"
        class="contextMenu"
      >
        <el-button
          type="text"
          :disabled="item.disabled"
          class="contextMenuItem"
          @click="handleContextMenuItem(item)"
          >{{ item.label }}</el-button
        >
      </div>
    </anji-contextMenu>
  </div>
</template>
<script>
import AnjiTree from "@/components/AnjiPlus/anji-tree.vue";
import EditDialog from "./edit";
import request from "@/utils/request";
import anjiContextMenu from "@/components/AnjiPlus/anji-contextMenu";
export default {
  components: {
    EditDialog,
    AnjiTree,
    anjiContextMenu
  },
  props: {
    option: {
      require: true,
      type: Object,
      default: () => {
        return {
          formHeight: this.$refs.formSearch.$el.offsetHeight,
          // 详情页中输入框左边文字宽度
          labelWidth: "120px",
          // 查询区隐藏
          queryFormHide: false,
          // 查询表单条件
          queryFormFields: [],
          // 按钮
          buttons: {
            query: {},
            edit: {},
            delete: {},
            add: {}
          },
          // 表格列
          columns: [],
          queryFormChange: (fileName, val) => {}
        };
      }
    }
  },
  data() {
    return {
      // 查询表单提交的值
      queryParams: {
        showMoreSearch: false, // 是否展开更多搜索条件
        pageNumber: 1,
        pageSize: 10,
        order: "",
        sort: ""
      },

      checkRecords: [], // 表格中当前选中的记录
      records: [], // 接口返回的记录列表
      total: 0, // 接口返回的总条数

      // 编辑详情弹框
      editDialogOpen: false, // 新建时主动打开编辑弹框
      editDialogRowData: {}, // 编辑时的主键
      editDialogModelType: "view", // 编辑 查看

      hasCustomButtonInRowMore: false, // 除了编辑删除外，还有自定义的行按钮

      isShowRowContextMenu: false,
      contextMenuConfigStyle: {},
      contextMenuRow: {}
    };
  },

  computed: {
    // 查询区隐藏
    queryFormTreeHide() {
      const flag =
        this.option.queryFormHide != null && this.option.queryFormHide == true;
      return flag;
    },
    // 左侧树形查询条件
    queryFormTreeField() {
      const treeField = this.option.queryFormFields.find(
        item => item["inputType"] == "anji-tree"
      );
      return treeField;
    },
    // 查询条件里是否有树形控件
    hasTreeFieldInQueryForm() {
      return this.isNotBlank(this.queryFormTreeField);
    },
    // 不包含树形控件的查询条件
    queryFormFieldExcludeTree() {
      let treeFields = this.option.queryFormFields.filter(
        item => item["inputType"] != "anji-tree"
      );
      return treeFields;
    },
    // 主键的列名
    primaryKeyFieldName() {
      let primaryKey = this.option.columns.find(
        item => item["primaryKey"] == true
      );
      if (primaryKey != null) {
        return primaryKey["field"];
      } else {
        return null;
      }
    },

    // 表格中可展开的列
    tableExpandColumns() {
      let expandColumns = this.option.columns.filter(
        item => item["columnType"] == "expand"
      );
      return expandColumns;
    },

    // 是否可以批量删除
    disableBatchDelete() {
      return this.checkRecords.length <= 0;
    }
  },
  created() {
    // 为查询框中所有input加上默认值
    this.option.queryFormFields.forEach(item => {
      // 动态添加属性
      this.$set(this.queryParams, item.field, item.defaultValue || null);
    });
    // 查询列表
    if (this.option.skipQuery || this.option.skipQuery == undefined) {
      this.handleQueryForm("query");
    }
    this.queryFormChange();
  },
  mounted() {
    if (this.$scopedSlots["rowButtonInMore"] != null) {
      this.hasCustomButtonInRowMore = true;
    } else {
      this.hasCustomButtonInRowMore = false;
    }
    console.log(`是否有自定义行按钮: ${this.hasCustomButtonInRowMore}`);
  },
  methods: {
    queryFormFieldSpan(item) {
      if (item.span != null) {
        return item.span;
      } else {
        return 6;
      }
    },
    // 切换更多搜索条件
    handleToggleMoreSearch() {
      this.queryParams.showMoreSearch = !this.queryParams.showMoreSearch;
    },
    // 列上排序切换
    handleSortChange(column) {
      // {column: {…}, prop: "orgCode", order: "ascending"}
      if (column == null || column.prop == null) {
        console.warn("排序字段名prop为空，无法排序");
        return;
      }
      let sort = column.prop; // 列表查询默认排序列
      let order = column.order == "ascending" ? "ASC" : "DESC";
      this.queryParams["sort"] = sort;
      this.queryParams["order"] = order;
      this.handleQueryForm("query");
    },
    // 查询按钮
    handleQueryForm(from) {
      // 如果是点查询按钮，把树的查询属性去掉
      if (from == "query") {
        if (this.hasTreeFieldInQueryForm) {
          delete this.queryParams[this.queryFormTreeField.field];
        }
      }
      // 如果是点树查询，把查询区里的属性去掉
      if (from == "tree") {
        if (this.hasTreeFieldInQueryForm) {
          let treeVal = this.queryParams[this.queryFormTreeField.field];
          this.queryParams = {
            showMoreSearch: false,
            pageNumber: 1,
            pageSize: 10
          };
          this.queryParams[this.queryFormTreeField.field] = treeVal;
        }
      }
      // 默认的排序
      if (
        this.isBlank(this.queryParams["order"]) &&
        this.isNotBlank(this.option.buttons.query.order)
      ) {
        this.queryParams["sort"] = this.option.buttons.query.sort;
        this.queryParams["order"] = this.option.buttons.query.order;
      }
      this.queryParams.pageNumber = 1;

      // 添加一些其他的查询参数
      if (this.option.buttons.query.params) {
        const params = this.option.buttons.query.params;
        for (const key in params) {
          this.queryParams[key] = params[key];
        }
      }

      this.handleQueryPageList();
    },
    // 外部追加参数进来
    handleAddQueryParams(k, v) {
      this.queryParams[k] = v;
    },
    // 列表查询
    async handleQueryPageList() {
      // 将特殊参数值urlcode处理
      let params = this.urlEncodeObject(this.queryParams, "order,sort");
      const { data, code } = await this.option.buttons.query.api(params);
      if (code != "200") return;
      this.records = data.records;
      this.total = data.total;
    },
    // 重置
    handleResetForm() {
      const showMoreSearch = this.queryParams.showMoreSearch;
      this.queryParams = {
        order: "",
        sort: "",
        pageNumber: 1,
        pageSize: 10,
        showMoreSearch
      };

      // 查询条件表单只读模式下不重置默认值
      const queryFormFieldsOption = this.option.queryFormFields;
      queryFormFieldsOption.forEach(el => {
        if (el.disabled) {
          this.queryParams[el.field] = el.defaultValue;
        }
      });
    },
    // 树形查询条件点击回调
    handleTreeNodeCheck() {
      this.handleQueryForm("tree");
      // 为新建页面的对应属性值，绑定上对应的默认值
      let treeFieldName = this.queryFormTreeField["field"];
      for (let i = 0; i < this.option.columns.length; i++) {
        let item = this.option.columns[i];
        if (
          item["editField"] == treeFieldName ||
          item["field"] == treeFieldName
        ) {
          this.$set(
            this.option.columns[i],
            "defaultValue",
            this.queryParams[treeFieldName]
          );
          break;
        }
      }
    },
    // 编辑和查看操作
    handleOpenEditView(modelType, row) {
      if (modelType == "view" || modelType == "edit") {
        this.editDialogRowData = row;
      }
      this.editDialogModelType = modelType;
      if (modelType == "add") {
        // 新增模式，不需要查询数据详情，直接打开
        this.editDialogOpen = true;
      }
      const obj = {
        type: modelType,
        value: row
      };
      this.$emit("handleCustomValue", obj);
    },
    handlegetLable(item, label) {
      if (typeof label == "function") {
        return label(item);
      } else {
        return label;
      }
    },
    // 是否disabled
    isDisabledButton(item, row) {
      if (typeof item.isDisable === "function") {
        return item.isDisable(row);
      } else {
        return !!item.disabled;
      }
    },
    // 是否显示
    isHide(item, row) {
      if (typeof item.isHide === "function") {
        return item.isHide(row);
      } else {
        return !item.isHide;
      }
    },
    // 弹框被关闭时的回调事件
    editDialogClosedEvent(value) {
      // 把列表页中弹框打开标记改成已关闭
      this.editDialogOpen = false;
      // 关闭弹出框时，如果有树，刷新下
      if (
        this.hasTreeFieldInQueryForm &&
        this.$refs.queryFormTree != null &&
        !value
      ) {
        this.$refs.queryFormTree.queryData();
      }
      this.$emit("handleCustomClose");
      this.handleQueryPageList();
      // 关闭时 清空表单的验证规则
      this.$refs.edit.$refs.mainForm.$refs.editForm.resetFields();
    },
    // 批量删除
    handleDeleteBatch(row) {
      let ids = [];
      if (row != null) {
        ids.push(row[this.primaryKeyFieldName]); // 删除指定的行
      } else {
        // 批量删除选中的行
        ids = this.checkRecords.map(item => item[this.primaryKeyFieldName]);
      }
      this.$confirm("删除确认", "确认要删除吗?", {
        type: "warning",
        confirmButtonClass: "delete_sure",
        cancelButtonClass: "el-button--danger is-plain"
      })
        .then(() => {
          this.option.buttons.delete.api(ids).then(res => {
            // {code: "200", message: "操作成功", data: true}
            this.checkRecords = [];
            // 关闭弹出框时，如果有树，刷新下
            if (
              this.hasTreeFieldInQueryForm &&
              this.$refs.queryFormTree != null
            ) {
              this.$refs.queryFormTree.queryData();
            }
            this.handleQueryPageList();
          });
        })
        .catch(e => {
          e;
        });
    },

    // 选择项改变时
    handleSelectionChange(val) {
      if (val.length > 0) {
        val.forEach(el => {
          this.records.forEach(ev => {
            if (el.id == ev.id) {
              ev.dblClickFlag = true;
              ev.bgColor = true;
            }
          });
        });
      } else {
        this.records.forEach(ev => {
          ev.dblClickFlag = false;
          ev.bgColor = false;
        });
      }
      this.isShowRowContextMenu = false;
      this.checkRecords = val;
    },
    // 双击
    handleSelectionDblclick(row) {
      row.dblClickFlag = !row.dblClickFlag;
      row.bgColor = row.dblClickFlag;
      this.$refs.tables.toggleRowSelection(row, row.dblClickFlag);
    },
    // 右键
    rowContextMenu(row, column, event) {
      event.preventDefault();
      this.option.contextMenu.forEach(el => {
        if (el.flag == "all") {
          el.disabled = !(this.checkRecords.length > 1);
        } else {
          el.disabled = this.checkRecords.length > 1;
        }
      });

      // 设置右键位置
      this.contextMenuConfigStyle = {
        left: event.clientX + "px",
        top: event.clientY + "px",
        display: "block"
      };
      // 获取当前右键行数据
      this.contextMenuRow = row;
      // 获取我们自定义的右键菜单
      this.isShowRowContextMenu = true;
    },
    handleContextMenuItem(item) {
      if (item.flag == "all") {
        item.click({ selection: this.checkRecords });
      } else {
        item.click({ msg: this.contextMenuRow });
      }
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
    // 带单位的列，需要转换
    fieldLabel(columnConfig) {
      let objUnitText = "";
      const localStorageUnit = this.getSettingByName("unit_conversion");
      const objUnit = {};
      for (const key in localStorageUnit) {
        columnConfig.anjiInput &&
          key
            .toLowerCase()
            .indexOf(columnConfig.anjiInput.unit.toLowerCase()) != -1 &&
          (objUnit[key] = localStorageUnit[key]);
      }
      for (const key in objUnit) {
        key.toLowerCase().indexOf("text") != -1 && (objUnitText = objUnit[key]);
      }
      if (columnConfig == null) {
        return "";
      }
      if (
        columnConfig.inputType == "anji-input" &&
        columnConfig.anjiInput != null
      ) {
        return columnConfig.anjiInput["defaultUnit"] == undefined
          ? `${columnConfig.label}(${objUnitText})`
          : `${columnConfig.label}(${columnConfig.anjiInput["defaultUnit"]})`;
      } else {
        return columnConfig.label;
      }
    },
    // 带单位的输入框
    fieldValueByAnjiInput(value, columnConfig) {
      const localStorageUnit = this.getSettingByName("unit_conversion");
      let objUnitConversion = "";
      let objUnitKeepPoint = "";
      let objUnitConversionRadioGroup = [];
      const objUnit = {};
      for (const key in localStorageUnit) {
        columnConfig.anjiInput &&
          key
            .toLowerCase()
            .indexOf(columnConfig.anjiInput.unit.toLowerCase()) != -1 &&
          (objUnit[key] = localStorageUnit[key]);
      }
      for (const key in objUnit) {
        key.toLowerCase().indexOf("conversion") != -1 &&
          key.toLowerCase().indexOf("conversiontext") == -1 &&
          key.toLowerCase().indexOf("conversionradiogroup") == -1 &&
          (objUnitConversion = objUnit[key]);
        key.toLowerCase().indexOf("keeppoint") != -1 &&
          (objUnitKeepPoint = objUnit[key]);
        Array.isArray(objUnit[key]) &&
          (objUnitConversionRadioGroup = objUnit[key]);
      }

      if (columnConfig == null) {
        return value;
      }
      if (
        columnConfig.inputType == "anji-input" &&
        columnConfig.anjiInput != null
      ) {
        if (columnConfig.anjiInput["defaultUnit"] == undefined) {
          // 不存在
          return (value / objUnitConversion).toFixed(objUnitKeepPoint || 2);
        } else {
          const coversion = objUnitConversionRadioGroup.find(
            item => item.label == columnConfig.anjiInput["defaultUnit"]
          )["value"];
          return (value / coversion).toFixed(objUnitKeepPoint || 2);
        }
      } else {
        return value;
      }
    },
    // 带表格列格式化的值
    fieldValueByRowRenderer(row, columnConfig) {
      if (
        columnConfig == null ||
        typeof columnConfig.fieldTableRowRenderer != "function"
      ) {
        return row[columnConfig.field];
      } else {
        return columnConfig.fieldTableRowRenderer(row);
      }
    },
    // 暴露给外部crud页面，回传saveForm的值
    getMainEntity() {
      return this.$refs.edit.getSaveForm();
    },
    setMainEntity(object) {
      this.$refs.edit.setSaveForm(object);
    },
    async switchChange(val, api) {
      request({
        url: api.url,
        method: "put",
        headers: { noPrompt: false },
        data: [val.id]
      }).then(response => {
        this.handleQueryPageList();
      });
    },
    queryFormChange(fileName, fieldVal) {
      if (typeof this.option.queryFormChange == "function") {
        this.option.queryFormChange(this.queryParams, fileName, fieldVal);
      }
    },
    // 给表格某行改变颜色
    tableRowClassName({ row, rowIndex }) {
      if ((row.urgentFlag || row.tableRow) && !row.bgColor) {
        return "warning-row";
      } else if ((row.urgentFlag || row.tableRow) && row.bgColor) {
        return "warning-row bgColor";
      } else if ((!row.urgentFlag || !row.tableRow) && row.bgColor) {
        return "bgColor";
      }
      if ((rowIndex + 1) % 2 === 0) {
        return "success-row";
      }
    }
  }
};
</script>

<style scoped lang="scss">
.right-container {
  display: flex;
  flex: 1;
  flex-direction: column;
  .main_part {
    display: flex;
    flex-direction: column;
    flex: 1;
    background: #fff;
    border-radius: 4px;
    padding: 12px 20px 12px;
    margin-top: 4px;
    height: 100%;
    position: relative;
  }
}
/deep/.button {
  box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.08);
  border-radius: 6px;
}
/deep/.el-table th > .cell {
  text-align: center;
}
/deep/.el-table .cell {
  text-align: center;
}
/deep/.elTable {
  margin: 10px 0 50px;
}
.el-table {
  // 看这里！！！
  // 深度选择器，去除默认的padding
  /deep/ th {
    padding: 0;
    height: 36px;
  }
  /deep/ td {
    padding: 0;
    height: 36px;
  }
}
/deep/.el-table--striped .el-table__body tr.el-table__row--striped td {
  background: #f9fbfd;
}
.screenFlex {
  display: flex;
}
.searchFormFlex {
  flex: 1;
}
.screenButtons {
  padding-left: 20px;
}
.style-btn {
  pointer-events: none;
}
.page-container {
  height: 100%;
  position: relative;
  .left-container {
    width: 20%;
    position: absolute;
    top: 0;
    left: 0;
    background: #fff;
    border-radius: 4px 0px 0px 4px;
    padding: 20px 20px 0;
    overflow: hidden;
    overflow-y: auto;
    height: 100%;
  }
  .right-container {
    width: calc(80% - 5px);
    position: absolute;
    top: 0;
    right: 0;
    background: #fff;
    border-radius: 0px 4px 4px 0px;
    padding: 20px 20px 0;
    height: 100%;
  }
}
.el-table .cell,
.el-table td div {
  overflow: hidden;
  text-overflow: ellipsis;
}
.el-dropdown {
  font-size: 12px;
  display: inline;
  color: #5887fb;
  cursor: pointer;
}
.el-dropdown-menu--mini .el-dropdown-menu__item {
  min-width: 80px;
  max-width: 110px;
  float: right;
  .el-button--text {
    float: right;
  }
  &:hover {
    background: none !important;
  }
  /deep/.el-button--text:hover,
  .el-button--text:focus {
    color: #799ffc !important;
    background-color: #ecf5ff !important;
    border-color: transparent;
  }
  .el-button--mini {
    float: right;
  }
  .el-button--text:hover,
  .el-button--text:focus {
    color: #799ffc;
    border-color: transparent;
  }
  .el-button + .el-button {
    margin-left: 0 !important;
    float: right;
  }
}
/deep/.el-pagination.is-background .btn-prev,
.el-pagination.is-background .btn-next,
.el-pagination.is-background .el-pager li {
  margin: 0 5px;
  border-radius: 2px;
  background-color: #f4f4f5;
  color: #606266;
  min-width: 30px;
  border-radius: 2px;
}
/deep/.el-pagination.is-background .el-pager li:not(.disabled).active {
  background-color: #5887fb;
  color: #ffffff;
  border-radius: 4px;
}
.page_bottom {
  width: 100%;
  position: absolute;
  bottom: 0;
}
.pagination {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin-bottom: 14px;
  margin-right: 20px;
}
.el-table /deep/ .warning-row {
  color: red !important;
}
.el-table /deep/ .bgColor {
  background: #d9ecff;
}
/deep/.edit_button {
  width: 22px;
  height: 22px;
  padding: 0;
  margin: 0;
  margin-right: 5px;
  /deep/ i {
    font-size: 30px;
  }
}
.el-form-item--mini.el-form-item {
  margin-bottom: 12px;
}
.el-table /deep/ .success-row {
  background: #f9fbfd !important;
}

.contextMenu {
  width: 100px;
  .contextMenuItem {
    width: 100%;
    font-size: 12px;
    line-height: 20px;
    padding: 5px;
  }
  &:hover {
    background: #f9fbfd;
  }
}
</style>
