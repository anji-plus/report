<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-12 20:52:19
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
    <basicModal @register="registerModal" @onOk="handleSubmit">
      <div class='tree'>
        <n-tree
          block-line
          cascade
          checkable
          :data="treeData"
          :default-selected-keys="checkedKeys"
          :selected-keys="checkedKeys"
          :checked-keys="checkedKeys"
          key-field="id"
          default-expand-all
          @update:checked-keys="handleCheckedKeysChange"
        />
      </div>
    </basicModal>
  </div>
</template>
<script lang="ts" setup>
  import { ref, unref } from 'vue'
  import type { TreeOption } from 'naive-ui'
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { basicModal, useModal } from '@/components/Modal'

  import { useMessage } from 'naive-ui'

  import { getFormSchemas, getTableButtons, getDialogRecordingSchemas, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toDeleteApi, toUpdateApi, toGetDataDetailApi, accessRoleAuthorityTree, saveAuthorityTree } from '@/api/access/accessRole'

  interface rowProps {
    accessKey: string;
    authorityList?: any[];
    createByView: string;
    createTime: string;
    deleteFlag: number | string;
    enableFlag: number | string;
    id: number | string;
    roleCode: string;
    roleName: string;
    updateBy: string;
    updateByView: string;
    updateTime: string;
    version: number;
  }

  const messages = useMessage()

  const treeData = ref<TreeOption[]>([])
  const checkedKeys = ref<string[]>([])
  const rowData = ref<Partial<rowProps> | null>(null)

  // 新增
  const addClick = () => {
    toAdd()
  }

  // 批量删除
  const removeAll = () => {
    toRemoveAll()
  }

  // 编辑
  const updateClick = (row) => {
    toUpdate(row)
  }

  // 删除
  const removeSingle = (row) => {
    toRemove(row)
  }

  const getTreeData = async (roleCode) => {
    const { code, data } = await accessRoleAuthorityTree(roleCode)
    if(code != 200) return
    treeData.value = data.treeData
    checkedKeys.value = data.checkedKeys
  }

  const handleCheckedKeysChange = (keys) => {
    checkedKeys.value = keys
  }

  const handleSubmit = async () => {
    const params = {
      roleCode: unref(rowData)?.roleCode,
      authorityList: unref(checkedKeys)
    }
    const { code, message } = await saveAuthorityTree(params)
    if(code != 200) return
    messages.success(message)
    closeModal()
  }

  // 分配权限
  const toSetPermission = (row) => {
    rowData.value = row
    openModal()
    getTreeData(row.roleCode)
  }

  const [registerModal, { openModal, closeModal }] = useModal({
    title: '分配权限'
  })

  const { rowsButtons } = getTableButtons({ addClick, removeAll })
  const { columns } = getTableColumns({ updateClick, removeSingle, toSetPermission })

  const [register, { toAdd, toUpdate, toRemoveAll, toRemove }] = useCrud({
    searchFormOption: {
      schemas: getFormSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive 按钮其他属性
      tableButtons: rowsButtons
    },
    dialogRecordingData: {
      width: 800,
      size: "small",
      labelPlacement: "left",
      labelWidth: 100,
      schemas: getDialogRecordingSchemas()
    },
    tableOptions: {
      // navie table配置
      columns: columns, // 表格配置
    },
    apiOptions: {
      queryApi: toGetPageList, // 查询
      addApi: toAddApi, // 新增
      removeApi: toDeleteApi, // 删除
      updateApi: toUpdateApi, // 修改
      getDataByIdApi: toGetDataDetailApi // 查询详情页
    }
  });
</script>
<style lang="less" scoped>
  .tree {
    height: 50vh;
    overflow-y: auto;
  }
</style>
