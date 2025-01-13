<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 16:34:50
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-13 22:05:54
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
    <basicModal @register="registerModal" @onOk='validateForm(formElRef, handleSubmit)'>
      <n-form
        class="form"
        label-width="120"
        size="small"
        label-placement="left"
        :model="formModel"
        :rules="rules"
        ref="formElRef"
      >
        <n-grid :x-gap="12" :cols="3">
          <n-form-item-gi label="数据源类型" path="sourceType">
            <JsqSelect v-model:value="formModel['sourceType']" dict-code="SOURCE_TYPE" placeholder="请选择" @update:value="sourceTypeChange"/>
          </n-form-item-gi>
          <n-form-item-gi label="数据源编码" path="sourceCode">
            <n-input v-model:value="formModel['sourceCode']" placeholder="唯一标识" clearable />
          </n-form-item-gi>
          <n-form-item-gi label="数据源名称" path="sourceName">
            <n-input v-model:value="formModel['sourceName']" clearable />
          </n-form-item-gi>
        </n-grid>
        <n-grid :x-gap="12" :cols="1">
          <n-form-item-gi label="数据源描述" path="sourceDesc">
            <n-input type="textarea" v-model:value="formModel['sourceDesc']" clearable />
          </n-form-item-gi>
          <template v-for="(item, index) in daymicFormOptions" :key="index">
            <n-form-item-gi :label="item.labelValue">
              <n-input v-model:value="item.value" clearable />
            </n-form-item-gi>
          </template>
        </n-grid>
      </n-form>
      <template #centerFooter>
        <n-button type="warning" @click="validateForm(formElRef, toTest)">测试</n-button>
      </template>
    </basicModal>
  </div>
</template>
<script lang="ts" setup>
  import { ref, unref } from 'vue'
  import { JsqSelect } from '@/components/Base/Jsq-select';
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { basicModal, useModal } from '@/components/Modal'
  import { getFormSchemas, getTableButtons, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toDeleteApi, toUpdateApi, toGetDataDetailApi, testConnection } from '@/api/report/dataSource'
  import { useMessage } from 'naive-ui'
  import  type { FormInst } from 'naive-ui'
  import { DialogType } from '@/enums/common'
  import { getDictName } from '@/utils';

  const messages = useMessage()
  const formElRef = ref<FormInst | null>(null)
  const sourceTypeOptions = ref<any[]>([])
  const daymicFormOptions = ref<any[]>([])
  const dialogType = ref<DialogType>(DialogType.ADD)
  const formModel = ref<Recordable>({})
  const testReplyCode = ref<string>('')

  const rules = {
    sourceType: { required: true, message: "数据源类型必选", trigger: ['blur', 'change'] },
    sourceCode: { required: true, message: "数据集编码必填", trigger: "blur" },
    sourceName: { required: true, message: "数据源名称必选", trigger: "blur" }
  }

  interface InitModelProps {
    type: DialogType,
    row?: Object
  }

  // 新增
  const addClick = () => {
    initModel({ type: DialogType.ADD })
  }
  // 编辑
  const updateClick = (row) => {
    initModel({ type: DialogType.EDIT, row })
  }
  // 批量删除
  const removeAll = () => {
    toRemoveAll()
  }

  // 删除
  const removeSingle = (row) => {
    toRemove(row)
  }

  const { rowsButtons } = getTableButtons({ addClick, removeAll })
  const { columns } = getTableColumns({ updateClick, removeSingle })

  const [register, { toRemoveAll, toRemove, toQuery }] = useCrud({
    searchFormOption: {
      schemas: getFormSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive 按钮其他属性
      tableButtons: rowsButtons
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

  //-- 弹框
  const [registerModal, { openModal, closeModal }] = useModal({
    width: 800,
    title: '项目基础配置'
  })

  const initModel = (props: InitModelProps) => {
    const { type, row } = props
    dialogType.value = type
    sourceTypeOptions.value = getDictName('SOURCE_TYPE')
    
    if(dialogType.value !== DialogType.ADD) {
      getDetailData(row)
    }
    openModal()
  }

  const getDetailData = async (row) => {
    const { code, data } = await toGetDataDetailApi(row)
    if(code != 200) return
    setFormOptions(row.sourceType)
    formModel.value = data
  }

  const sourceTypeChange = (val: string) => {
    setFormOptions(val)
  }

  const setFormOptions = (val: string) => {
    daymicFormOptions.value = JSON.parse(unref(sourceTypeOptions).find(item => item.id == val)?.extend)
  }

  const getPrams = () => {
    const params = { ...formModel.value }
    const sourceConfig = {}
    unref(daymicFormOptions).forEach(item => {
      sourceConfig[item.label] = item.value
    })
    params['sourceConfig'] = JSON.stringify(sourceConfig)

    return params
  }

  // 测试
  const toTest = async () => {
    const params = getPrams()
    const { code } = await testConnection(params)
    if(code == 200) {
      testReplyCode.value = code
      messages.success('测试通过')
    } else {
      testReplyCode.value = ''
    }
  }

  const handleSubmit = async () => {
    if(unref(testReplyCode) != '200') return messages.error('测试通过后方可保存!')
    const params = getPrams()
    const api = unref(dialogType) == DialogType.ADD ? toAddApi : toUpdateApi
    const { code, message } = await api(params)
    if(code == 200) {
      messages.success('配置成功!')
    } else {
      messages.error(message)
    }
    toQuery()
    restFiles()
    closeModal()
  }

  const restFiles = () => {
    daymicFormOptions.value = []
    formModel.value = {}
  }

  // 校验
  const validateForm = (formRefName: FormInst | null, callback: () => void) => {
    formRefName?.validate((errors) => {
      if (!errors) {
        callback()
      }
      else {
        console.log(errors)
        messages.error('验证失败')
      }
    })
  }
  
</script>
<style lang="less" scoped>
.form {
  margin-top: 20px;
}
</style>


