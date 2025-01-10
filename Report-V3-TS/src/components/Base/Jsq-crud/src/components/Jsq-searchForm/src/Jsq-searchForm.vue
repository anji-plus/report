<template>
  <div class="search">
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
              <n-gi :key="schema.field" v-if="index < 3 || formModel.showMoreSearch">
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
        <div class="search-box-btn">
          <n-space justify="center">
            <n-button v-if="getSchema.length > 3" size="small" @click="handleToggleMoreSearch">{{
              formModel.showMoreSearch ? '收起' : '展开'
            }}</n-button>
            <n-button size="small" @click="toRestForm">重置</n-button>
            <n-button type="primary" size="small" @click="emit('toQuery')">查询</n-button>
          </n-space>
        </div>
      </div>
    </n-form>
  </div>
</template>
<script lang="ts" setup>
  import { onMounted, ref, reactive, unref, useAttrs, computed, watch } from 'vue';
  import { FormProps, FormActionType, FormSchema } from './types/searchForm';
  import { JsqSelect } from '@/components/Base/Jsq-select';
  import { basicProps } from './props';
  import { deepMerge } from '@/utils';

  import { isFunction, isNullOrUnDef } from '@/utils/is';

  // 通过props传递的参数
  const props = defineProps({ ...basicProps });
  // 收集父节点传递的数据
  const attrs = useAttrs();
  const emit = defineEmits(['register','input', 'change', 'toRestForm', 'toQuery']);

  // 表单对象
  const defaultFormModel = ref<any>({});
  const formModel = reactive<Recordable>({});
  const formElRef = ref<Nullable<FormActionType>>(null);
  // useSearchForm传递过来的参数
  const propsRef = ref<Partial<FormProps>>({});
  const schemaRef = ref<Nullable<FormSchema[]>>(null);

  const searchForm = defineModel()
  searchForm.value = formModel

  const getProps = computed(() => {
    return { ...props, ...attrs, ...(unref(propsRef) as any) };
  });

  watch(() => formModel, () => {
    emit('change', formModel)
  }, {
    deep: true
  })
  // 获取表单配置项
  const getSchema = computed(() => {
    const schemas: FormSchema[] = unref(schemaRef) || (unref(getProps).schemas as any);
    return schemas as FormSchema[];
  });

  const getFormItem = (values: FormSchema) => {
    return values as any;
  };

  const getBindValue = computed(() => ({ ...attrs, ...props, ...unref(getProps) } as Recordable));

  const getComponentProps = (schema) => {
    const compProps = handleComponentProps(schema);
    return {
      clearable: true,
      ...compProps,
    };
  };

  const setProps = async (formProps: Partial<FormProps>): Promise<void> => {
    propsRef.value = deepMerge(unref(propsRef) || {}, formProps);
  };

  const setSchema = async (schemaProps: FormSchema[]): Promise<void> => {
    schemaRef.value = schemaProps;
  };

  const handleComponentProps = (schema) => {
    let { componentProps = {} } = schema ?? {};
    if (isFunction(componentProps)) {
      componentProps = componentProps({ model: formModel, formAction: formActionType }) ?? {};
    }

    return componentProps;
  };

  const handleToggleMoreSearch = () => {
    formModel.showMoreSearch = !formModel.showMoreSearch;
  };

  watch(() => getSchema.value, (schema)=> {
    if(schema?.length) {
      initDefault()
    }
  })

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

  const toRestForm = () => {
    Object.keys(formModel).forEach((key) => {
      formModel[key] = unref(defaultFormModel)[key] || null;
    });
    emit('toRestForm')
  }
  
  const formActionType = {
    setProps,
    setSchema,
  };

  onMounted(() => {
    emit('register', formActionType);
  });

  defineExpose({
    ...formActionType,
  });
</script>
<style lang="less" scoped>
  .search {
    border-bottom: 1px solid rgb(219, 221, 227);
    &-box {
      width: 100%;
      display: flex;
      flex-direction: row;
      &-form {
        flex: 1;
      }
      &-btn {
        margin-left: 20px;
      }
    }
  }
</style>
