<!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-12-13 10:42:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2022-3-9 10:04:24
 !-->
<template>
  <div>
    <el-row>
      <el-col v-if="selectIsHide('country')" :span="4">
        <el-select
          v-model.trim="countryCode"
          filterable
          placeholder="请选择国家"
          :disabled="disabled"
          clearable
          @change="countryChange"
        >
          <el-option
            v-for="(option, i) in countryArr"
            :key="i"
            :value="option.value"
            :label="option.label"
          />
        </el-select>
      </el-col>
      <el-col v-if="selectIsHide('province')" :span="7">
        <el-select
          v-model.trim="provinceCode"
          filterable
          placeholder="请选择省"
          :disabled="disabled"
          clearable
          @change="provinceChange"
        >
          <el-option
            v-for="(option, i) in casCaredArr"
            :key="i"
            :value="option.value"
            :label="option.label"
          />
        </el-select>
      </el-col>
      <el-col v-if="selectIsHide('city')" :span="7">
        <el-select
          v-model.trim="cityCode"
          filterable
          placeholder="请选择市"
          :disabled="disabled"
          clearable
          @change="cityChange"
        >
          <el-option
            v-for="(option, x) in cityArr"
            :key="x"
            :value="option.value"
            :label="option.label"
          />
        </el-select>
      </el-col>
      <el-col v-if="selectIsHide('area')" :span="6">
        <el-select
          v-model.trim="areaCode"
          filterable
          placeholder="请选择区"
          :disabled="disabled"
          clearable
          @change="districtChange"
        >
          <el-option
            v-for="(option, y) in districtArr"
            :key="y"
            :value="option.value"
            :label="option.label"
          />
        </el-select>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import axios from "axios";
import { getToken } from "@/utils/auth";
export default {
  name: "Cselect",
  props: {
    url: {
      type: String,
      default: () => "/meta/metaAreaInfo/countryTree"
    },
    value: null,
    singleDisplay: String,
    disabled: Boolean
  },
  data() {
    return {
      countryArr: [],
      casCaredArr: [],
      cityArr: [],
      districtArr: [],
      countryCode: "", // 国code
      provinceCode: "", // 省code
      cityCode: "", // 州市code
      areaCode: "", // 区县code
      countryName: "",
      provinceName: "",
      cityName: "",
      areaName: ""
    };
  },
  watch: {
    value(value) {
      this.echoSelect(value);
      this.initData();
    }
  },
  mounted() {
    this.initData();
    this.echoSelect(this.value);
  },
  methods: {
    // singleDisplay 不配显示 country province city area 配那个那个不显示
    selectIsHide(val) {
      if (this.singleDisplay === undefined) {
        return true;
      } else {
        return !(this.singleDisplay.indexOf(val) >= 0);
      }
    },
    // 查询数据
    initData() {
      this.queryData();
    },
    queryData() {
      axios({
        url: process.env.BASE_API + this.url,
        methods: "get",
        headers: {
          Authorization: getToken(),
          systemCode: process.env.VUE_APP_SYSTEM_CODE
        }
      }).then(res => {
        const data = res.data;
        if (data.code != 200 || data.data.length == 0) return;
        this.countryArr = data.data;
        !this.selectIsHide("country") &&
          (this.casCaredArr = data.data[0].children);
        this.updateCountry();
        this.updateCity();
        this.updateDistrict();
      });
    },
    updateCountry() {
      for (let i in this.countryArr) {
        let obj = this.countryArr[i];
        if (obj.value == this.countryCode) {
          this.casCaredArr = obj.children;
          break;
        }
      }
    },
    updateCity() {
      for (let i in this.casCaredArr) {
        let obj = this.casCaredArr[i];
        if (obj.value) {
          if (obj.value == this.provinceCode) {
            this.cityArr = obj.children;
            break;
          }
        }
      }
    },
    updateDistrict() {
      for (let i in this.cityArr) {
        let obj = this.cityArr[i];
        if (obj.value == this.cityCode) {
          this.districtArr = obj.children;
          break;
        }
      }
    },

    // 国
    countryChange(val) {
      if (val) {
        this.updateCountry();
        this.provinceCode = "";
        this.cityCode = "";
        this.areaCode = "";
        const casCared = this.countryArr.find((n, index) => {
          if (n.value == val) {
            return n;
          }
        });
        this.countryName = casCared.label;
        const obj = {
          countryName: this.countryName,
          countryCode: this.countryCode,
          provinceCode: this.provinceCode,
          cityCode: this.cityCode,
          areaCode: this.areaCode,
          provinceName: this.provinceName,
          cityName: this.cityName,
          areaName: this.areaName
        };
        this.$emit("input", obj);
        this.$emit("change", obj);
      } else {
        this.$emit("input", {});
        this.$emit("change", {});
      }
    },
    // 省
    provinceChange(val) {
      if (val) {
        this.updateCity();
        this.cityCode = "";
        this.areaCode = "";
        const casCared = this.casCaredArr.find((n, index) => {
          if (n.value == val) {
            return n;
          }
        });
        this.provinceName = casCared.label;
        const obj = {
          countryName: this.countryName,
          countryCode: this.countryCode,
          provinceCode: this.provinceCode,
          cityCode: this.cityCode,
          areaCode: this.areaCode,
          provinceName: this.provinceName,
          cityName: this.cityName,
          areaName: this.areaName
        };
        this.$emit("input", obj);
        this.$emit("change", obj);
      } else {
        this.$emit("input", {});
        this.$emit("change", {});
      }
    },
    // 市
    cityChange(val) {
      if (val) {
        this.areaCode = "";
        this.updateDistrict();
        const city = this.cityArr.find((n, index) => {
          if (n.value == val) {
            return n;
          }
        });
        this.cityName = city.label;
        const obj = {
          countryName: this.countryName,
          countryCode: this.countryCode,
          provinceCode: this.provinceCode,
          cityCode: this.cityCode,
          areaCode: this.areaCode,
          provinceName: this.provinceName,
          cityName: this.cityName,
          areaName: this.areaName
        };
        this.$emit("input", obj);
        this.$emit("change", obj);
      } else {
        this.$emit("input", {});
        this.$emit("change", {});
      }
    },
    // 区
    districtChange(val) {
      if (val) {
        const district = this.districtArr.find((n, index) => {
          if (n.value == val) {
            return n;
          }
        });
        this.areaName = district.label;
        const obj = {
          countryName: this.countryName,
          countryCode: this.countryCode,
          provinceCode: this.provinceCode,
          cityCode: this.cityCode,
          areaCode: this.areaCode,
          provinceName: this.provinceName,
          cityName: this.cityName,
          areaName: this.areaName
        };
        this.$emit("input", obj);
        this.$emit("change", obj);
      } else {
        this.$emit("input", {});
        this.$emit("change", {});
      }
    },
    echoSelect(value) {
      if (!value) {
        this.countryCode = "";
        this.provinceCode = "";
        this.cityCode = "";
        this.areaCode = "";
        this.countryName = "";
        this.provinceName = "";
        this.cityName = "";
        this.areaName = "";
      } else {
        this.countryName = this.value.countryName;
        this.countryCode = this.value.countryCode;
        this.provinceCode = this.value.provinceCode;
        this.cityCode = this.value.cityCode;
        this.areaCode = this.value.areaCode || this.value.regionCode;
        this.provinceName = this.value.provinceName;
        this.cityName = this.value.cityName;
        this.areaName = this.value.areaName || this.value.regionName;
      }
    }
  }
};
</script>
