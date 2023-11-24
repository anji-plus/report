<!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-12-13 10:42:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2022-5-4 10:04:24
 !-->
<template>
  <el-checkbox-group v-model="selectValue" class="filter-item" @change="change">
    <el-checkbox
      v-for="item in options"
      :key="item.id"
      :label="item.id"
      :disabled="disabled"
      >{{ item.text }}</el-checkbox
    >
  </el-checkbox-group>
</template>

<script>
import request from "@/utils/request";
export default {
  props: {
    dictCode: null, // 当传入dictCode时，可以不用传递url
    url: null,
    value: null,
    placeholder: null,
    label: {
      type: String,
      default: "text"
    },
    option: {
      type: String,
      default: "id"
    },
    multiple: null,
    localOptions: null,
    disabled: null,
    clearable: {
      type: Boolean,
      default: true
    },
    collapseTags: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      options: null,
      selectValue: []
    };
  },
  computed: {
    // 根据dictCode和url拼出最终的请求url
    requestUrl() {
      if (this.url != null && this.url.trim() != "") {
        return this.url;
      }
      if (this.dictCode != null && this.dictCode.trim() != "") {
        return `/tms/gaeaDict/select/${this.dictCode}`;
      }
      return null;
    }
  },
  watch: {
    value: function(val, oldVal) {
      this.echoCheckboxValue(val);
    }
  },
  mounted() {
    this.echoCheckboxValue(this.value);
    if (this.requestUrl == null) {
      this.options = this.localOptions;
      return;
    }
    this.queryData();
  },
  methods: {
    change(value) {
      const strValue = value.join(",");
      if (value === "") {
        value = null;
      }
      this.$emit("input", strValue);
      this.$emit("change", strValue, this.options);
    },
    // 从本地localStorage取 gaeaDict
    getOptionsFromLocalStorage() {
      let dicts = JSON.parse(localStorage.getItem("AJReportDict"));
      let options = [];
      if (!dicts.hasOwnProperty(this.dictCode)) {
        return [];
      }
      let dictItems = dicts[this.dictCode];
      for (let i = 0; i < dictItems.length; i++) {
        let dictItem = dictItems[i];
        options.push({ id: dictItem.id.toString(), text: dictItem.text });
      }
      return options;
    },
    queryData() {
      // 所有从本地localStorage取，因为在App.vue中已经请求远程保存到本地了
      let options = this.getOptionsFromLocalStorage();
      if (this.isNotBlank(options)) {
        this.options = options;
        return;
      }
      // 本地localStorage取不到，再从远程接口取
      if (this.requestUrl == null) {
        return;
      }
      request({
        url: this.requestUrl,
        params: {
          multiple: this.multiple == null ? null : 1
        }
      }).then(response => {
        this.options = response.data;
      });
    },
    // 回显
    echoCheckboxValue(val) {
      if (!val) {
        this.selectValue = [];
      } else {
        const arr = val.split(",");
        this.selectValue = arr;
      }
    }
  }
};
</script>
