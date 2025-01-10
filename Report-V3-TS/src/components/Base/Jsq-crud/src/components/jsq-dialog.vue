<template>
  <basicModal @register="register" @onOk='handleSubmit' @onClose="close">
    <n-form
      class="form"
      v-bind="getBindValue"
      :model="formModel"
      ref="formElRef"
    >
      <div class="search-box">
        <div class="search-box-form">
          <n-grid :x-gap="12" :y-gap="8" :cols="2">
            <template v-for="(schema, index) in getSchema">
              <n-gi>
                <n-form-item
                  v-if="!isHideForm(schema)"
                  v-bind="getFormItem(schema)"
                  :rule="schema.rules"
                  :label="schema.label"
                  :path="schema.field"
                >
                  <!--NCheckbox-->
                  <template v-if="schema.component === 'NCheckbox'">
                    <n-checkbox
                      v-model:checked="formModel[schema.field]"
                      v-bind="getComponentProps(schema)"
                    />
                  </template>
                  <!-- JsqSelect -->
                  <template v-else-if="schema.component === 'JsqSelect'">
                    <JsqSelect
                      v-model:value="formModel[schema.field]"
                      v-bind="getComponentProps(schema)"
                    />
                  </template>
                  <!-- valueFormat NDatePicker -->
                  <template
                    v-else-if="
                      schema.component === 'NDatePicker' && getComponentProps(schema)?.valueFormat
                    "
                  >
                    <n-date-picker
                      style="width: 100%"
                      v-model:formatted-value="formModel[schema.field]"
                      v-bind="getComponentProps(schema)"
                      clearable
                    />
                  </template>
                  <!-- valueFormat NTimePicker -->
                  <template
                    v-else-if="
                      schema.component === 'NTimePicker' && getComponentProps(schema)?.valueFormat
                    "
                  >
                    <n-time-picker
                      v-model:formatted-value="formModel[schema.field]"
                      v-bind="getComponentProps(schema)"
                      clearable
                    />
                  </template>
                  <!-- 动态渲染表单 -->
                  <component
                    v-else
                    v-bind="getComponentProps(schema)"
                    :is="schema.component"
                    v-model:value="formModel[schema.field]"
                  />
                </n-form-item>
              </n-gi>
            </template>
          </n-grid>
        </div>
      </div>
    </n-form>
  </basicModal>
</template>
<script lang='ts' setup>
  import { useAttrs, computed, reactive, unref, ref } from 'vue'
  import { basicModal, useModal } from '@/components/Modal'
  import { DialogType, DialogTitle } from '@/enums/common'
  import { JsqSelect } from '@/components/Base/Jsq-select';

  import { useMessage } from 'naive-ui'

  import { isFunction, isNullOrUnDef } from '@/utils/is';

  interface InitModelProps {
    type: DialogType,
    row?: Object
  }

  const messages = useMessage()

  const emit = defineEmits(['refresh'])

  const attrs = useAttrs()
  const defaultFormModel = ref<any>({});
  const formModel = reactive<Recordable>({})
  const dialogType = ref<DialogType>(DialogType.ADD)
  const formElRef = ref()
  const rowData = ref<object>({})

  const getBindValue = computed(() => ({ ...attrs} as Recordable));

  const getFormItem = (values) => {
    return values as any;
  };

  const getComponentProps = (schema) => {
    const compProps = handleComponentProps(schema);
    return {
      clearable: true,
      ...compProps,
    };
  };

  const handleComponentProps = (schema) => {
    let { componentProps = {} } = schema ?? {};
    if (isFunction(componentProps)) {
      componentProps = componentProps({ model: formModel }) ?? {};
    }
    return componentProps;
  };

  const isHideForm = (schema) => {
    const { editHide = '' } = schema
    return editHide.includes(dialogType.value)
  }

  const getSchema = computed(() => {
    return unref(getBindValue).schemas
  })

  const setParams = () => {

    return formModel
  }

  const handleSubmit = async () => {
    const params = setParams()
    const api = dialogType.value == DialogType.ADD ? unref(getBindValue).api.addApi : unref(getBindValue).api.updateApi
    const { code, message } = await api(params)
    if(code != 200) return
    emit('refresh')
    messages.success(message)
    handleClose()
  }

  const handleClose = () => {
    resetFields()
    closeModal()
  }

  const close = () => {
    resetFields()
  }

  const [register, { openModal, closeModal }] = useModal({
    title: DialogTitle[dialogType.value]
  })

  const initModel = (props: InitModelProps) => {
    initDefault()
    const { type, row } = props
    dialogType.value = type
    rowData.value = row || {}
    if(dialogType.value !== DialogType.ADD) {
      getDetailData(row)
    }
    openModal()
  }

  const getDetailData = async (row) => {
    const { code, data } = await unref(getBindValue).api.getDataByIdApi(row)
    if(code != 200) return
    Object.assign(formModel, data)
  }


  // 初始化默认值
  const initDefault = () => {
    const schemas = unref(getSchema)
    const obj: Recordable = {}
    schemas.forEach(item => {
      const { defaultValue } = item.componentProps
      if(!isNullOrUnDef(defaultValue)) {
        obj[item.field] = defaultValue
        formModel[item.field] = defaultValue
      }
    })

    defaultFormModel.value = obj
  }

  // 重置表单
  const resetFields = () => {
    Object.keys(formModel).forEach(key => {
      formModel[key] = unref(defaultFormModel)[key] || null
    })
  }

  defineExpose({
    initModel
  })
</script>
<style lang='less' scoped>
.form {
  margin-top: 20px;
}
</style>
