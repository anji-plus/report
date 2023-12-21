<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>
<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

import vue from "vue";
import VueSuperSlide from "vue-superslide";

vue.use(VueSuperSlide);
export default {
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      hackReset: true,
      options: {
        title: {},
        legend: {},
        radar: {
          indicator: [],
        },
        series: [],
      },
      optionsSetup: {},
      optionsPosition: {},
      optionsData: {},
      flagInter: null,
    };
  },
  computed: {
    styleObj() {
      const allStyle = this.optionsPosition;
      return {
        position: this.ispreview ? "absolute" : "static",
        width: allStyle.width + "px",
        height: allStyle.height + "px",
        left: allStyle.left + "px",
        top: allStyle.top + "px",
        background: this.optionsSetup.background,
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
  },
  watch: {
    value: {
      handler(val) {
        this.optionsSetup = val.setup;
        this.optionsPosition = val.position;
        this.optionsData = val.data;
        this.editorOptions();
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsSetup = this.value.setup;
    this.optionsPosition = this.value.position;
    this.optionsData = this.value.data;
    this.editorOptions();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsRadar();
      this.setOptionsLegend();
      this.setOptionsTooltip();
      this.setOptionsMargin();
      this.setOptionsData();
    },
    // 标题修改
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {
        text: optionsSetup.text,
        show: optionsSetup.isShowTitle,
        left: optionsSetup.titleLeft,
        top: optionsSetup.titleTop + "%",
        itemGap: optionsSetup.titleItemGap,
        textStyle: {
          color: optionsSetup.textColor,
          fontSize: optionsSetup.textFontSize,
          fontWeight: optionsSetup.textFontWeight,
          fontStyle: optionsSetup.textFontStyle,
          fontFamily: optionsSetup.textFontFamily,
        },
        subtext: optionsSetup.subtext,
        subtextStyle: {
          color: optionsSetup.subtextColor,
          fontWeight: optionsSetup.subtextFontWeight,
          fontSize: optionsSetup.subtextFontSize,
          fontStyle: optionsSetup.subtextFontStyle,
          fontFamily: optionsSetup.subtextFontFamily
        },
      };
      this.options.title = title;
    },
    // 雷达设置
    setOptionsRadar() {
      const optionsSetup = this.optionsSetup;
      const axisLine = {
        show: optionsSetup.axisLineShow,
        lineStyle: {
          color: optionsSetup.axisLineColor,
          opacity: optionsSetup.axisLineOpacity / 100,
        },
      };
      const axisName = {
        show: optionsSetup.axisNameShow,
        color: optionsSetup.axisNameColor,
        fontSize: optionsSetup.axisNameFontSize,
        fontStyle: optionsSetup.axisNamFontStyle,
        fontWeight: optionsSetup.axisNamFontWeight,
      };
      const splitLine = {
        show: optionsSetup.splitLineShow,
        lineStyle: {
          color: optionsSetup.splitLineColor,
          opacity: optionsSetup.splitLineOpacity / 100,
        },
      };
      this.options.radar.axisLine = axisLine;
      // echarts5.X以上，name属性被替换为axisName
      this.options.radar.name = axisName;
      this.options.radar.splitLine = splitLine;
      this.options.radar.shape = optionsSetup.radarShape;
      this.options.radar.splitNumber = optionsSetup.splitNumber;
    },
    // 图例配置
    setOptionsLegend() {
      const optionsSetup = this.optionsSetup;
      const legend = {
        show: optionsSetup.isShowLegend,
        left: optionsSetup.lateralPosition,
        //right: optionsSetup.lateralPosition,
        top: optionsSetup.longitudinalPosition,
        //bottom: optionsSetup.longitudinalPosition,
        orient: optionsSetup.layoutFront,
        textStyle: {
          color: optionsSetup.legendColor,
          fontSize: optionsSetup.legendFontSize,
          fontWeight: optionsSetup.legendFontWeight,
          fontStyle: optionsSetup.legendFontStyle,
          fontFamily: optionsSetup.legendFontFamily,
        },
        itemHeight: optionsSetup.legendHeight,
        itemWidth: optionsSetup.legendWidth,
      };
      this.options.legend = legend;
    },
    // 图例名称设置
    setOptionsLegendName(name) {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      const legendName = optionsSetup.legendName;
      // 图例没有手动写则显示原值，写了则显示新值
      if (null == legendName || legendName == "") {
        for (let i = 0; i < name.length; i++) {
          series[0].data[i].name = name[i];
        }
        this.options.legend["data"] = name;
      } else {
        const arr = legendName.split("|");
        for (let i = 0; i < arr.length; i++) {
          series[0].data[i].name = arr[i];
        }
        this.options.legend["data"] = arr;
      }
    },
    // tooltip 提示语设置，鼠标放置显示
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        show: optionsSetup.isShowTooltip,
        textStyle: {
          color: optionsSetup.tooltipColor,
          fontSize: optionsSetup.tooltipFontSize,
          fontWeight: optionsSetup.tooltipFontWeight,
          fontStyle: optionsSetup.tooltipFontStyle,
          fontFamily: optionsSetup.tooltipFontFamily,
        },
      };
      this.options.tooltip = tooltip;
    },
    // 雷达大小设置
    setOptionsMargin() {
      this.options.radar.radius = "70%";
    },
    setOptionsData(e, paramsConfig) {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      // 联动接收者逻辑开始
      optionsData.dynamicData = optionsData.dynamicData || {}; // 兼容 dynamicData undefined
      const myDynamicData = optionsData.dynamicData;
      clearInterval(this.flagInter); // 不管咋，先干掉上一次的定时任务，避免多跑
      if (
        e &&
        optionsData.dataType !== "staticData" &&
        Object.keys(myDynamicData.contextData).length
      ) {
        const keyArr = Object.keys(myDynamicData.contextData);
        paramsConfig.forEach((conf) => {
          if (keyArr.includes(conf.targetKey)) {
            myDynamicData.contextData[conf.targetKey] = e[conf.originKey];
          }
        });
      }
      // 联动接收者逻辑结束
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    //去重
    setUnique(arr) {
      let newArr = [];
      arr.forEach((item) => {
        return newArr.includes(item) ? "" : newArr.push(item);
      });
      return newArr;
    },
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      this.options.color = arrColor;
      // 雷达设置相关
      const indicator = optionsSetup.dynamicAddRadar;
      this.options.radar.indicator = indicator;
      // 雷达图key值
      const radarKeys = [];
      for (const i in indicator) {
        radarKeys[i] = indicator[i].key;
      }
      const name = [];
      const data = [];
      const legendName = [];
      for (const i in val) {
        name[i] = val[i].name;
      }
      for (const i in name) {
        const values = new Array(radarKeys.length).fill(0);
        for (const j in radarKeys) {
          for (const k in val) {
            if (val[k].name == name[i]) {
              values[j] = val[k][radarKeys[j]];
            }
          }
        }
        data.push({
          name: name[i],
          value: values,
          label: {
            show: optionsSetup.isShow,
            position: optionsSetup.fontPosition,
            distance: optionsSetup.fontDistance,
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.fontColor == '' ? null : optionsSetup.fontColor,
            fontWeight: optionsSetup.fontWeight,
            fontStyle: optionsSetup.fontStyle,
            fontFamily: optionsSetup.fontFamily,
          },
          lineStyle: {
            normal: {
              width: optionsSetup.lineWidth,
              type: optionsSetup.lineType,
              color: arrColor[i],
            },
          },
        });
        legendName.push(name[i]);
      }
      this.options.series[0] = {
        type: "radar",
        data: data,
        symbolSize: optionsSetup.symbolSize,
        areaStyle: {
          normal: {
            opacity: optionsSetup.opacity / 100,
          },
        },
      };
      this.options.legend["data"] = legendName;
      this.setOptionsLegendName(legendName);
    },
    dynamicDataFn(data, refreshTime) {
      if (!data) return;
      if (this.ispreview) {
        this.getEchartData(data);
        this.flagInter = setInterval(() => {
          this.getEchartData(data);
        }, refreshTime);
      } else {
        this.getEchartData(data);
      }
    },
    getEchartData(val) {
      const data = this.queryEchartsData(val);
      data.then((res) => {
        this.renderingFn(res);
      });
    },
    renderingFn(val) {
      const optionsSetup = this.optionsSetup;
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      this.options.color = arrColor;
      // 雷达设置相关
      const indicator = optionsSetup.dynamicAddRadar;
      this.options.radar.indicator = indicator;
      // 雷达图key值
      const radarKeys = [];
      for (const i in indicator) {
        radarKeys[i] = indicator[i].key;
      }
      const name = [];
      const data = [];
      const legendName = [];
      for (const i in val.value) {
        name.push(val.value[i][val.name]);
      }
      for (const i in name) {
        const values = new Array(radarKeys.length).fill(0);
        for (const j in radarKeys) {
          for (const k in val.value) {
            if (val.value[k][val.name] == name[i]) {
              values[j] = val.value[k][radarKeys[j]];
            }
          }
        }
        data.push({
          name: name[i],
          value: values,
          label: {
            show: optionsSetup.isShow,
            position: optionsSetup.fontPosition,
            distance: optionsSetup.fontDistance,
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.fontColor == '' ? null : optionsSetup.fontColor,
            fontWeight: optionsSetup.fontWeight,
            fontStyle: optionsSetup.fontStyle,
            fontFamily: optionsSetup.fontFamily,
          },
          lineStyle: {
            normal: {
              type: optionsSetup.lineType,
              color: arrColor[i],
            },
          },
        });
        legendName.push(name[i]);
      }
      const series0 = {
        type: "radar",
        data: data,
        symbolSize: optionsSetup.symbolSize,
        areaStyle: {
          normal: {
            opacity: optionsSetup.opacity / 100,
          },
        },
      }
      this.$set(this.options.series, 0, series0);
      this.options.legend["data"] = legendName;
      this.setOptionsLegendName(legendName);
    },
  },
};
</script>
<style lang="scss" scoped>
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

/* 本例子css */
.txtScroll-top {
  overflow: hidden;
  position: relative;
}

.title {
  display: flex;
  flex-direction: row;
  width: 100%;
}

.title > div {
  height: 50px;
  line-height: 50px;
  width: 100%;
}

.txtScroll-top .bd {
  width: 100%;
}

.txtScroll-top .infoList li {
  height: 50px;
  line-height: 50px;
  display: flex;
  flex-direction: row;
}

.txtScroll-top .infoList li > div {
  width: 100%;
}

/*.txtScroll-top .infoList li:nth-child(n) {
  background: rgb(0, 59, 81);
}

.txtScroll-top .infoList li:nth-child(2n) {
  background: rgb(10, 39, 50);
}*/
</style>
