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

  import { useMessage, useDialog } from 'naive-ui'

  import { getFormSchemas, getTableButtons, getDialogRecordingSchemas, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toUpdateApi, toDeleteApi, toGetDataDetailApi, getRoleTree, saveRoleTree, resetPassword } from '@/api/access/accessUser'

  
  interface rowProps {
    accessKey: string;
    createBy: string;
    createByView: string;
    createTime: string;
    deleteFlag: number | string;
    enableFlag: number | string;
    email: string;
    lastLoginIp: string;
    lastLoginTime: string;
    loginName: string;
    phone: string;
    realName: string;
    remark: string;
    roleCodeList: any[];
    id: number | string;
    updateBy: string;
    updateByView: string;
    updateTime: string;
    version: number;
  }

  const messages = useMessage()
  const dialog = useDialog()
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
    const { code, data } = await getRoleTree(roleCode)
    if(code != 200) return
    treeData.value = data.treeData
    checkedKeys.value = data.checkedKeys
  }

  const handleCheckedKeysChange = (keys) => {
    checkedKeys.value = keys
  }

  const handleSubmit = async () => {
    const params = {
      loginName: unref(rowData)?.loginName,
      roleCodeList: unref(checkedKeys)
    }
    const { code, message } = await saveRoleTree(params)
    if(code != 200) return
    messages.success(message)
    closeModal()
  }

  // 分配权限
  const toSetPermission = (row) => {
    rowData.value = row
    openModal()
    getTreeData(row.loginName)
  }

  // 重置密码
  const toResetPassword = (row) => {
    dialog.warning({
      title: '提示',
      content: '你确定需要重置密码？',
      positiveText: '确定',
      negativeText: '取消',
      onPositiveClick: async () => {
        const { code, message } = await resetPassword(row)
        if(code != 200) return
        messages.success(message)
      },
      onNegativeClick: () => {
        messages.error('取消成功')
      }
    })
  }

  const [registerModal, { openModal, closeModal }] = useModal({
    title: '为用户分配权限'
  })

  const { rowsButtons } = getTableButtons({ addClick, removeAll })
  const { columns } = getTableColumns({ updateClick, removeSingle, toSetPermission, toResetPassword })

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
<style lang="less" scoped></style>
