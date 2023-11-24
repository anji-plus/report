<!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-12-13 10:17:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-12-13 10:17:24
 !-->
<template>
  <el-autocomplete
    v-model.trim="inputValue"
    :debounce="500"
    class="inline-input"
    :fetch-suggestions="querySearch"
    :disabled="disabled"
    @select="handleSelect"
    @input="changeInput"
  >
    <template slot-scope="{ item }">
      <div class="name">{{ getItemLabel(item, item.value) }}</div>
      <span class="addr">{{ item[option] }}</span>
    </template>
  </el-autocomplete>
</template>
<script>
import request from "@/utils/request";
export default {
  props: {
    disabled: {
      type: Boolean,
      default: () => {
        return false;
      }
    },
    value: {
      type: String,
      default: () => {
        return "";
      }
    },
    url: {
      type: String,
      default: () => {
        return "";
      }
    },
    appointValue: {
      type: String,
      default: () => {
        return "";
      }
    },
    label: {
      type: String,
      default: () => {
        return "";
      }
    },
    option: {
      type: String,
      default: () => {
        return "";
      }
    }
  },
  data() {
    return {
      restaurants: [],
      inputValue: ""
    };
  },
  watch: {
    value(val) {
      this.echoInput(val);
    }
  },
  mounted() {
    this.echoInput(this.value);
  },
  methods: {
    getItemLabel(item, value) {
      if (this.label.indexOf("${") < 0 && this.label.indexOf("}" < 0)) {
        return item[this.label];
      }
      let reg = /\$\{[a-zA-Z0-9]*\}/g;
      let list = this.label.match(reg);
      console.log(list);
      // ["${id}", "${text}"]
      let result = this.label;
      for (let i = 0; i < list.length; i++) {
        let sub = list[i];
        let key = sub.replace("${", "").replace("}", "");
        result = result.replace(sub, item[key]);
      }
      return value + " " + result;
    },
    querySearch(queryString, cb) {
      request({ url: this.url }).then(res => {
        if (res.code == 200 && res.data) {
          this.restaurants = res.data;
        } else {
          this.restaurants = [];
        }
        this.restaurants = JSON.parse(
          JSON.stringify(this.restaurants).replace(
            new RegExp(this.appointValue, "g"),
            "value"
          )
        );
        let results = queryString
          ? this.restaurants.filter(this.createFilter(queryString))
          : this.restaurants;
        cb(results);
      });
    },
    createFilter(queryString) {
      return restaurant => {
        return (
          restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) ===
          0
        );
      };
    },
    handleSelect(item) {
      this.$emit("input", item.value);
      this.$emit("change", item.value, item);
    },
    changeInput(val) {
      this.$emit("input", val);
      this.$emit("change", val);
    },
    // 回显
    echoInput(value) {
      if (!value) {
        this.inputValue = "";
      } else {
        this.inputValue = value;
      }
    }
  }
};
</script>
<style lang="less" scoped>
.inline-input {
  width: 100%;
}
</style>
