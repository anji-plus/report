<template>
  <div>
    <el-form label-width="80px" label-position="left">
      <el-form-item label="数据集">
        <el-select
          size="mini"
          v-model="dataSetValue"
          clearable
          placeholder="请选择"
          @change="selectDataSet"
        >
          <el-option
            v-for="item in dataSet"
            :key="item.code"
            :label="item.setName"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        v-for="(item, index) in userNameList"
        :key="index"
        :label="item.paramName"
      >
        <el-input v-model="item.sampleItem" size="mini" />
      </el-form-item>
      <el-form-item v-for="item in setParamList" :key="item" :label="item">
        <Dictionary
          v-model="params"
          :dict-key="'CHART_PROPERTIES'"
          @input="selectParams($event, item)"
        />
      </el-form-item>
      <el-button
        style="width: 100%"
        type="primary"
        plain
        size="mini"
        @click="saveDataBtn"
        >刷新</el-button
      >
    </el-form>
  </div>
</template>
<script>
import { queryAllDataSet, detailBysetId, getData } from "@/api/bigscreen";
import Dictionary from "@/components/Dictionary/index";

export default {
  name: "DynamicComponents",
  components: {
    Dictionary
  },
  model: {
    prop: "formData",
    event: "input"
  },
  props: {
    chartType: String,
    props: ["formData"]
  },
  data() {
    return {
      dataSetValue: "",
      dataSet: [], // 数据集
      userNameList: [], // 用户
      setParamList: [], // 对应的不同的图形数据参数
      params: {},
      chartProperties: {}
    };
  },
  computed: {
    setCode() {
      let code = "";
      this.dataSet.forEach(el => {
        if (el.id == this.dataSetValue) {
          code = el.setCode;
        }
      });
      return code;
    }
  },
  mounted() {
    this.loadDataSet();
  },
  methods: {
    async loadDataSet() {
      const { code, data } = await queryAllDataSet();
      this.dataSet = data;
      if (code != "200") return;
    },
    async selectDataSet() {
      const { code, data } = await detailBysetId(this.dataSetValue);
      this.userNameList = data.dataSetParamDtoList;
      this.setParamList = data.setParamList;
      if (code != "200") return;
    },
    async saveDataBtn() {
      const contextData = {};
      for (let i = 0; i < this.userNameList.length; i++) {
        contextData[this.userNameList[i].paramName] = this.userNameList[
          i
        ].sampleItem;
      }
      const params = {
        chartType: this.chartType,
        setCode: this.setCode,
        chartProperties: this.chartProperties,
        contextData
      };
      console.log(params);
      const { code, data } = await getData(params);
      const analysisData = this.analysisChartsData(data);
      console.log(analysisData);
      this.$emit("input", analysisData);
      this.$emit("change", params);
      if (code != "200") return;
    },
    selectParams(val, key) {
      this.chartProperties[key] = val;
    },
    // 解析不同图标的数据
    analysisChartsData(data) {
      // widget-barchart 柱线图、widget-linechart 折线图、 widget-barlinechart 柱线图、widget-piechart 饼图、widget-hollow-piechart 空心饼图
      // widget-funnel 漏斗图  widget-gauge 仪表盘
      const chartType = this.chartType;
      if (
        chartType == "widget-barchart" ||
        chartType == "widget-linechart" ||
        chartType == "widget-barlinechart"
      ) {
        return this.barOrLineChartFn(data);
      } else if (
        chartType == "widget-piechart" ||
        chartType == "widget-hollow-piechart" ||
        chartType == "widget-funnel"
      ) {
        return this.piechartFn(data);
      } else if (chartType == "widget-gauge") {
        return this.gaugeFn(data);
      } else {
      }
    },
    // 柱状图、折线图、折柱图
    barOrLineChartFn(data) {
      const ananysicData = {};
      const xAxisList = [];
      const series = [];
      for (const key in this.chartProperties) {
        const obj = {};
        const seriesData = [];
        const value = this.chartProperties[key];
        obj["type"] = value;
        for (let i = 0; i < data.length; i++) {
          if (value.startsWith("xAxis")) {
            // 代表为x轴
            xAxisList[i] = data[i][key];
          } else {
            // 其他的均为series展示数据
            seriesData[i] = data[i][key];
          }
        }
        obj["data"] = seriesData;
        if (!obj["type"].startsWith("xAxis")) {
          series.push(obj);
        }
      }
      ananysicData["xAxis"] = xAxisList;
      ananysicData["series"] = series;
      // console.log(ananysicData, '结果数据')
      return ananysicData;
    },
    // 饼图或者空心饼图或者漏斗图
    piechartFn(data) {
      const ananysicData = [];
      for (let i = 0; i < data.length; i++) {
        const obj = {};
        for (const key in this.chartProperties) {
          const value = this.chartProperties[key];
          if (value === "name") {
            obj["name"] = data[i][key];
          } else {
            obj["value"] = data[i][key];
          }
        }
        ananysicData.push(obj);
      }
      // console.log(ananysicData, '结果数据')
      return ananysicData;
    },
    gaugeFn(data) {
      const ananysicData = [];
      for (let i = 0; i < data.length; i++) {
        const obj = {};
        for (const key in this.chartProperties) {
          const value = this.chartProperties[key];
          if (value === "name") {
            obj["name"] = data[i][key];
          } else {
            obj["value"] = data[i][key];
          }
        }
        if (!obj["unit"]) {
          obj["unit"] = "%";
        }
        ananysicData.push(obj);
      }
      // console.log(ananysicData, '结果数据')
      return ananysicData[0];
    }
  }
};
</script>
<style lang="sass" scoped></style>
