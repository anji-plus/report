<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>
<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";
import "../../../../../../node_modules/echarts/map/js/china.js";
import "../../../../../../node_modules/echarts/map/js/world.js";
import "../../../../../../node_modules/echarts/map/js/province/anhui";
import "../../../../../../node_modules/echarts/map/js/province/aomen";
import "../../../../../../node_modules/echarts/map/js/province/beijing";
import "../../../../../../node_modules/echarts/map/js/province/chongqing";
import "../../../../../../node_modules/echarts/map/js/province/fujian";
import "../../../../../../node_modules/echarts/map/js/province/gansu";
import "../../../../../../node_modules/echarts/map/js/province/guangxi";
import "../../../../../../node_modules/echarts/map/js/province/guizhou";
import "../../../../../../node_modules/echarts/map/js/province/hainan";
import "../../../../../../node_modules/echarts/map/js/province/hebei";
import "../../../../../../node_modules/echarts/map/js/province/heilongjiang";
import "../../../../../../node_modules/echarts/map/js/province/henan";
import "../../../../../../node_modules/echarts/map/js/province/hubei";
import "../../../../../../node_modules/echarts/map/js/province/hunan";
import "../../../../../../node_modules/echarts/map/js/province/jiangsu";
import "../../../../../../node_modules/echarts/map/js/province/jiangxi";
import "../../../../../../node_modules/echarts/map/js/province/jilin";
import "../../../../../../node_modules/echarts/map/js/province/liaoning";
import "../../../../../../node_modules/echarts/map/js/province/neimenggu";
import "../../../../../../node_modules/echarts/map/js/province/ningxia";
import "../../../../../../node_modules/echarts/map/js/province/qinghai";
import "../../../../../../node_modules/echarts/map/js/province/shandong";
import "../../../../../../node_modules/echarts/map/js/province/shanghai";
import "../../../../../../node_modules/echarts/map/js/province/shanxi";
import "../../../../../../node_modules/echarts/map/js/province/shanxi1";
import "../../../../../../node_modules/echarts/map/js/province/sichuan";
import "../../../../../../node_modules/echarts/map/js/province/taiwan";
import "../../../../../../node_modules/echarts/map/js/province/tianjin";
import "../../../../../../node_modules/echarts/map/js/province/xianggang";
import "../../../../../../node_modules/echarts/map/js/province/xinjiang";
import "../../../../../../node_modules/echarts/map/js/province/xizang";
import "../../../../../../node_modules/echarts/map/js/province/yunnan";
import "../../../../../../node_modules/echarts/map/js/province/zhejiang";
import echarts from "echarts";
import "../../../../../../node_modules/echarts/map/js/china.js";
//https://www.makeapie.com/editor.html?c=x2yaz6dfRw
//https://www.makeapie.com/editor.html?c=xMpGBbTEKU
let geoCoordMap = {
  台湾省: [121.5135, 25.0308],
  黑龙江省: [127.9688, 45.368],
  内蒙古自治区: [110.3467, 41.4899],
  吉林省: [125.8154, 44.2584],
  北京市: [116.4551, 40.2539],
  辽宁省: [123.1238, 42.1216],
  河北省: [114.4995, 38.1006],
  天津市: [117.4219, 39.4189],
  山西省: [112.3352, 37.9413],
  陕西省: [109.1162, 34.2004],
  甘肃省: [103.5901, 36.3043],
  宁夏回族自治区: [106.3586, 38.1775],
  青海省: [101.4038, 36.8207],
  新疆维吾尔自治区: [87.9236, 43.5883],
  西藏自治区: [91.11, 29.97],
  四川省: [103.9526, 30.7617],
  重庆市: [108.384366, 30.439702],
  山东省: [117.1582, 36.8701],
  河南省: [113.4668, 34.6234],
  江苏省: [118.8062, 31.9208],
  安徽省: [117.29, 32.0581],
  湖北省: [114.3896, 30.6628],
  浙江省: [119.5313, 29.8773],
  福建省: [119.4543, 25.9222],
  江西省: [116.0046, 28.6633],
  湖南省: [113.0823, 28.2568],
  贵州省: [106.6992, 26.7682],
  云南省: [102.9199, 25.4663],
  广东省: [113.12244, 23.009505],
  广西壮族自治区: [108.479, 23.1152],
  海南省: [110.3893, 19.8516],
  上海市: [121.4648, 31.2891],
  香港: [114.173355, 22.320048],
  澳门: [113.54909, 22.198951],
};
let data = [
  {
    name: "南海诸岛",
    value: 1,
  },
  {
    name: "北京",
    value: 524,
  },
  {
    name: "天津",
    value: 14,
  },
  {
    name: "上海",
    value: 150,
  },
  {
    name: "重庆",
    value: 75,
  },
  {
    name: "河北",
    value: 13,
  },
  {
    name: "河南",
    value: 83,
  },
  {
    name: "云南",
    value: 11,
  },
  {
    name: "辽宁",
    value: 19,
  },
  {
    name: "黑龙江",
    value: 15,
  },
  {
    name: "湖南",
    value: 69,
  },
  {
    name: "安徽",
    value: 260,
  },
  {
    name: "山东",
    value: 39,
  },
  {
    name: "新疆",
    value: 4,
  },
  {
    name: "江苏",
    value: 31,
  },
  {
    name: "浙江",
    value: 104,
  },
  {
    name: "江西",
    value: 36,
  },
  {
    name: "湖北",
    value: 1052,
  },
  {
    name: "广西",
    value: 33,
  },
  {
    name: "甘肃",
    value: 347,
  },
  {
    name: "山西",
    value: 8,
  },
  {
    name: "内蒙古",
    value: 157,
  },
  {
    name: "陕西",
    value: 22,
  },
  {
    name: "吉林",
    value: 4,
  },
  {
    name: "福建",
    value: 36,
  },
  {
    name: "贵州",
    value: 39,
  },
  {
    name: "广东",
    value: 996,
  },
  {
    name: "青海",
    value: 27,
  },
  {
    name: "西藏",
    value: 31,
  },
  {
    name: "四川",
    value: 46,
  },
  {
    name: "宁夏",
    value: 16,
  },
  {
    name: "海南",
    value: 22,
  },
  {
    name: "台湾",
    value: 6,
  },
  {
    name: "香港",
    value: 2,
  },
  {
    name: "澳门",
    value: 9,
  },
];
let convertData = function (data) {
  let res = [];
  for (let i = 0; i < data.length; i++) {
    let geoCoord = geoCoordMap[data[i].name];
    if (geoCoord) {
      res.push({
        name: data[i].name,
        value: geoCoord.concat(data[i].value),
      });
    }
  }
  return res;
};
let max = 6000,
  min = 10;
let maxSize4Pin = 100,
  minSize4Pin = 20;
import {eventBusParams} from "@/utils/screen";

export default {
  name: "widgetAirBubbleMap",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        //backgroundColor: '#0F1C3C',
        tooltip: {
          trigger: "item",
          formatter: function (params) {
            if (params.value.length > 1) {
              return params.data.name + "" + params.data.value[2];
            } else {
              return params.name;
            }
          },
        },
        geo: {
          map: "china",
          show: true,
          roam: true,
          label: {
            emphasis: {
              show: false,
            },
          },
          layoutSize: "80%",
          itemStyle: {
            normal: {
              borderColor: new echarts.graphic.LinearGradient(
                0,
                0,
                0,
                1,
                [
                  {
                    offset: 0,
                    color: "#00F6FF",
                  },
                  {
                    offset: 1,
                    color: "#53D9FF",
                  },
                ],
                false
              ),
              borderWidth: 1,
              shadowColor: "rgba(10,76,139,1)",
              shadowOffsetY: 0,
              shadowBlur: 60,
            },
          },
        },
        series: [
          {
            type: "effectScatter",
            coordinateSystem: "geo",
            rippleEffect: {
              brushType: "stroke",
            },
            showEffectOn: "render",
            itemStyle: {
              normal: {
                //气泡颜色
                color: {
                  type: "radial",
                  x: 0.5,
                  y: 0.5,
                  r: 0.5,
                  colorStops: [
                    {
                      offset: 0,
                      color: "rgba(5,80,151,0.2)",
                    },
                    {
                      offset: 0.8,
                      color: "rgba(5,80,151,0.8)",
                    },
                    {
                      offset: 1,
                      color: "rgba(0,108,255,0.7)",
                    },
                  ],
                  global: false,
                },
              },
            },
            label: {
              normal: {
                show: true,
                color: "#fff",
                fontWeight: "bold",
                position: "inside",
                formatter: function (para) {
                  return "{cnNum|" + para.data.value[2] + "}";
                },
                rich: {
                  cnNum: {
                    fontSize: 13,
                    color: "#D4EEFF",
                  },
                },
              },
            },
            symbol: "circle",
            symbolSize: function (val) {
              if (val[2] == 0) {
                return 0;
              }
              return (
                ((maxSize4Pin - minSize4Pin) / (max - min)) * val[2] +
                (maxSize4Pin -
                  ((maxSize4Pin - minSize4Pin) / (max - min)) * max) *
                1.2
              );
            },
            data: convertData(data),
            zlevel: 1,
          },
        ],
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
      optionsCollapse: {}, // 图标属性
      optionsSetup: {},
      flagInter: null,
    };
  },
  computed: {
    styleObj() {
      return {
        position: this.ispreview ? "absolute" : "static",
        width: this.optionsStyle.width + "px",
        height: this.optionsStyle.height + "px",
        left: this.optionsStyle.left + "px",
        top: this.optionsStyle.top + "px",
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
        this.optionsStyle = val.position;
        this.optionsData = val.data;
        this.optionsCollapse = val.setup;
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.setup;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
    eventBusParams(
      this.optionsSetup,
      this.optionsData,
      (dynamicData, optionsSetup) => {
        this.getEchartData(dynamicData, optionsSetup);
      }
    );
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsGeo();
      this.setOptionsData();
      this.setOptionAirSize();
      this.setOptionsTooltip();
    },
    // 标题设置
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
    setOptionsGeo() {
      const optionsSetup = this.optionsSetup;
      const geo = {
        map: this.optionsSetup.mapName == '' ? "china" : this.optionsSetup.mapName,
        show: true,
        roam: true,
        layoutSize: "80%",
        label: {
          //调整数值
          // 地图省市区显隐
          show: optionsSetup.isShowMap,
          color: optionsSetup.fontColor,
          fontSize: optionsSetup.fontSize,
          fontWeight: optionsSetup.fontWeight,
          fontStyle: optionsSetup.fontStyle,
          fontFamily: optionsSetup.fontFamily,
        },
        itemStyle: {
          normal: {
            //地图块颜色
            areaColor: {
              x: 0,
              y: 0,
              x2: 0,
              y2: 1,
              colorStops: [
                {
                  offset: 0,
                  color: optionsSetup.fontColor0, // 0% 处的颜色
                },
                {
                  offset: 1,
                  color: optionsSetup.fontColor100, // 100% 处的颜色
                },
              ],
            },
            borderType: optionsSetup.borderType,
            borderColor: optionsSetup.borderColor,
            borderWidth: optionsSetup.borderWidth,
            shadowColor: optionsSetup.shadowColor,
            shadowBlur: optionsSetup.shadowBlur,
            opacity: optionsSetup.opacity / 100,
          },
        },
        //鼠标放置颜色加深
        emphasis: {
          label: {
            show: optionsSetup.isShowEmphasisLabel,
            color: optionsSetup.emphasisLabelFontColor,
            fontSize: optionsSetup.emphasisLabelFontSize,
            fontWeight: optionsSetup.emphasisLabelFontWeight,
            fontStyle: optionsSetup.emphasisLabelFontStyle,
            fontFamily: optionsSetup.emphasisLabelFontFamily,
          },
          itemStyle: {
            areaColor: {
              x: 0,
              y: 0,
              x2: 0,
              y2: 1,
              colorStops: [
                {
                  offset: 0,
                  color: optionsSetup.emphasisLabelFontColor0, // 0% 处的颜色
                },
                {
                  offset: 1,
                  color: optionsSetup.emphasisLabelFontColor100, // 100% 处的颜色
                },
              ],
            },
          },
        },
      }
      this.options.geo = geo;
    },
    setOptionAirSize() {
      maxSize4Pin = this.optionsSetup.fontmaxSize4Pin;
      minSize4Pin = this.optionsSetup.fontminSize4Pin;
    },
    // tooltip 设置
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
        formatter: function (params) {
          if (params.value.length > 1) {
            return params.data.name + " " + params.data.value[2];
          } else {
            return params.name;
          }
        },
      };
      this.options.tooltip = tooltip;
    },
    //数据解析
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
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      const label = this.options.series[0]["label"];
      const normal = {
        show: optionsSetup.isShowData,
        color: "#fff",
        fontWeight: "bold",
        position: "inside",
        formatter: function (para) {
          return "{cnNum|" + para.data.value[2] + "}";
        },
        rich: {
          cnNum: {
            fontSize: optionsSetup.fontDataSize,
            color: optionsSetup.fontDataColor,
            fontWeight: optionsSetup.fontDataWeight,
            fontStyle: optionsSetup.fontDataStyle,
            fontFamily: optionsSetup.fontDataFamily,
          },
        },
      };
      const data = convertData(val);
      this.options.series[0]["data"] = data;
      label["normal"] = normal;
    },
    dynamicDataFn(val, refreshTime) {
      if (!val) return;
      if (this.ispreview) {
        this.getEchartData(val);
        this.flagInter = setInterval(() => {
          this.getEchartData(val);
        }, refreshTime);
      } else {
        this.getEchartData(val);
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
      const label = this.options.series[0]["label"];
      const normal = {
        show: optionsSetup.isShowData,
        color: "#fff",
        fontWeight: "bold",
        position: "inside",
        formatter: function (para) {
          return "{cnNum|" + para.data.value[2] + "}";
        },
        rich: {
          cnNum: {
            fontSize: optionsSetup.fontDataSize,
            color: optionsSetup.fontDataColor,
            fontWeight: optionsSetup.fontDataWeight,
            fontStyle: optionsSetup.fontDataStyle,
            fontFamily: optionsSetup.fontDataFamily,
          },
        },
      };
      const data = convertData(val);
      this.options.series[0]["data"] = data;
      label["normal"] = normal;
    },
  },
};
</script>
<style lang="scss" scoped>
.echartMap {
  width: 100%;
  height: 100%;
}

.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
