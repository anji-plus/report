<template>
  <basicModal @register="register" >
    <n-form
      v-bind="getBindValue"
      size="small"
      label-placement="left"
      :model="formModel"
      ref="formElRef"
    >
      <div class="search-box">
        <div class="search-box-form">
          <n-grid :x-gap="12" :y-gap="8" :cols="3">
            <template v-for="(schema, index) in getSchema">
              <n-gi >
                <n-form-item
                  v-bind="getFormItem(schema)"
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
  import { useAttrs, computed, reactive, unref } from 'vue'
  import { basicModal, useModal } from '@/components/Modal'
  import { DialogType } from '@/enums/common'
  import { JsqSelect } from '@/components/Base/Jsq-select';

  import { isFunction } from '@/utils/is';

  interface InitModelProps {
    type: DialogType,
    row?: Object
  }

  const attrs = useAttrs()
  const formModel = reactive<Recordable>({})
  console.log('11', attrs)

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

  const getSchema = computed(() => {
    return unref(getBindValue).schemas
  })

  const [register, { openModal }] = useModal({
    title: '新增'
  })

  const initModel = (props: InitModelProps) => {
    const { type, row } = props
    console.log('type', type)
    console.log('row', row)
    openModal()
  }

  defineExpose({
    initModel
  })
</script>
<style lang='less' scoped></style>
