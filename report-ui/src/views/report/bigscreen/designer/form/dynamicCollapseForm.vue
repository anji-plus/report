<template>
  <el-collapse accordion>
    <el-collapse-item
      v-for="(item, index) in options"
      :key="index"
      :title="item.name"
      :name="index"
    >
      <dynamicForm
        :options="item.list"
        @onChanged="onChanged"
      />
    </el-collapse-item>
  </el-collapse>
</template>
<script>
import dynamicForm from './dynamicForm'
export default {
  name: 'WidgetTemp',
  components: {
    dynamicForm,
  },
  props: {
    options: Array,
  },
  data() {
    return {
      formData: {},
    }
  },
  watch: {
    options(val) {
      console.log(val)
    }
  },
  mounted() {
    this.handlerOptions()
  },
  methods: {
    onChanged(val) {
      console.log(val)
      for (const i in val) {
        this.formData[i] = this.deepClone(val[i])
      }
      this.$emit('onChanged', this.formData)
    },
    handlerOptions() {
      for (let i = 0; i < this.options.length; i++) {
        const item = this.options[i]
        for (let j = 0; j < item.list.length; j++) {
          this.formData[item.list[j].name] = item.list[j].value
        }
      }
    },
  },
}
</script>

<style scoped lang="scss">
.el-collapse {
  border-top: none;
  border-bottom: none;
}
/deep/.el-collapse-item__header {
  height: 40px;
  line-height: 40px;
  background: transparent;
  color: #bcc9d4;
  font-weight: 300;
  font-size: 12px;
  border-color: #282e3a;
}
/deep/.el-collapse-item__wrap {
  background: transparent;
  border: none;
}
/deep/.el-collapse-item__content {
  padding-bottom: 0;
}
</style>
