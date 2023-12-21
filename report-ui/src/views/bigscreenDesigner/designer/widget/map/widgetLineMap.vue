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
import "echarts/map/js/china.js";
import echarts from "echarts";
import {conversionCity} from "@/utils/china";

let geoCoordMap = conversionCity;
let planePath =
  "path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z";
export default {
  name: "widgetLineMap",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        title: {
          left: "center",
          textStyle: {
            color: "#fff",
          },
        },
        tooltip: {
          trigger: "item",
          formatter: function (params, ticket, callback) {
            if (params.seriesType == "effectScatter") {
              return "线路：" + params.data.name + "" + params.data.value[2];
            } else if (params.seriesType == "lines") {
              return (
                params.data.fromName +
                ">" +
                params.data.toName +
                "<br />" +
                params.data.value
              );
            } else {
              return params.name;
            }
          },
        },
        legend: {
          show: true,
          orient: "vertical",
          top: "bottom",
          left: "right",
          textStyle: {
            color: "#fff",
          },
          selectedMode: "multiple",
        },
        geo: {
          map: "china",
          label: {
            emphasis: {
              show: true,
              color: "white",
            },
          },
          roam: true,
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
            type: "lines",
            zlevel: 1,
            effect: {
              show: false,
              period: 6,
              trailLength: 0.7,
              color: "#fff",
              symbolSize: 3,
            },
            lineStyle: {
              normal: {
                color: "#a6c84c",
                width: 0,
                curveness: 0.2,
              },
            },
            data: [],
          },
          {
            type: "lines",
            zlevel: 2,
            symbol: ["none", "arrow"],
            symbolSize: 10,
            effect: {
              show: true,
              period: 4,
              trailLength: 0,
              symbol: "arrow",
              symbolSize: 5,
            },
            lineStyle: {
              normal: {
                // 颜色+ 线条
                color: "#ffa022",
                width: 1,
                opacity: 0.4,
                curveness: 0.2,
              },
            },
            data: [],
          },
          {
            // 起点
            type: "effectScatter",
            coordinateSystem: "geo",
            zlevel: 2,
            rippleEffect: {
              brushType: "stroke",
            },
            label: {
              normal: {
                show: true,
                position: "right",
                formatter: "{b}",
                fontSize: 22,
              },
            },
            // 点的大小
            symbolSize: 10,
            itemStyle: {
              normal: {
                // 地图点颜色
                color: "#46bee9",
              },
            },
            data: [],
          },
          {
            // 终点
            type: "effectScatter",
            coordinateSystem: "geo",
            zlevel: 2,
            rippleEffect: {
              brushType: "stroke",
            },
            label: {
              normal: {
                show: true,
                position: "right",
                formatter: "{b}",
                fontSize: 22,
              },
            },
            // 点的大小
            symbolSize: 10,
            itemStyle: {
              normal: {
                // 地图点颜色
                color: "#46bee9",
              },
            },
            data: [],
          },
        ],
      },
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
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true,
    },
  },
  created() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsSetup = this.value.setup;
  },
  mounted() {
    this.editorOptions();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    convertData(data) {
      let res = [];
      for (let i = 0; i < data.length; i++) {
        let dataItem = data[i];
        let sourceCoord = geoCoordMap[dataItem.source];
        let targetCoord = geoCoordMap[dataItem.target];
        if (sourceCoord && targetCoord) {
          res.push({
            fromName: dataItem.source,
            toName: dataItem.target,
            coords: [sourceCoord, targetCoord],
            value: dataItem.value,
          });
        }
      }
      return res;
    },
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsGeo();
      this.setOptionsSource();
      this.setOptionsTarget();
      this.setOptionsSymbol();
      this.setOptionsLine();
      this.setOptionsTooltip();
      this.setOptionsData();
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
    // 地图设置
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
    // 起点设置
    setOptionsSource() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[2];
      const normal = {
        show: optionsSetup.isShowSource,
        position: optionsSetup.sourceFontPosition,
        color: optionsSetup.sourceFontColor,
        fontSize: optionsSetup.sourceFontSize,
        fontWeight: optionsSetup.sourceFontWeight,
        fontStyle: optionsSetup.sourceFontStyle,
        fontFamily: optionsSetup.sourceFontFamily
      };
      const itemStyle = {
        normal: {
          color: optionsSetup.sourcePointColor,
        },
      };
      series.symbolSize = optionsSetup.sourceSymbolSize;
      series.label.normal = normal;
      series.itemStyle = itemStyle;
    },
    // 终点设置
    setOptionsTarget() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[3];
      const normal = {
        show: optionsSetup.isShowTarget,
        position: optionsSetup.targetFontPosition,
        color: optionsSetup.targetFontColor,
        fontSize: optionsSetup.targetFontSize,
        fontWeight: optionsSetup.targetFontWeight,
        fontStyle: optionsSetup.sourceFontStyle,
        fontFamily: optionsSetup.sourceFontFamily
      };
      const itemStyle = {
        normal: {
          color: optionsSetup.targetPointColor,
        },
      };
      series.symbolSize = optionsSetup.targetSymbolSize;
      series.label.normal = normal;
      series.itemStyle = itemStyle;
    },
    // 图标设置
    setOptionsSymbol() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[1];
      const effect = {
        show: true,
        period: this.setPeriod(optionsSetup),
        trailLength: 0,
        symbol: this.setSymbol(optionsSetup),
        symbolSize: optionsSetup.symbolSize,
        color: optionsSetup.symbolColor,
      };
      series["effect"] = effect;
    },
    setSymbol(optionsSetup) {
      let symbol;
      if (optionsSetup.symbol == "plane") {
        symbol = planePath;
      } else {
        symbol = "arrow";
      }
      return symbol;
    },
    setPeriod(optionsSetup) {
      let period;
      if (optionsSetup.symbol == "plane") {
        period = optionsSetup.symbolPeriod - 1;
      } else {
        period = optionsSetup.symbolPeriod;
      }
      return period;
    },
    // 线设置
    setOptionsLine() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[1];
      const lineStyle = {
        normal: {
          // 线条颜色
          color: optionsSetup.lineColor,
          width: optionsSetup.lineWidth,
          opacity: 0.4,
          curveness: 0.2,
        },
      };
      series["lineStyle"] = lineStyle;
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
        formatter: function (params, ticket, callback) {
          if (params.seriesType == "effectScatter") {
            return "线路：" + params.data.name + "" + params.data.value[2];
          } else if (params.seriesType == "lines") {
            return (
              params.data.fromName +
              ">" +
              params.data.toName +
              "<br />" +
              params.data.value
            );
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
      const series = this.options.series;
      series[0]["data"] = this.convertData(val);
      series[1]["data"] = this.convertData(val);
      series[2]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.source,
            value: geoCoordMap[dataItem.source].concat([dataItem.value]),
          };
        }
      });
      series[3]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.target,
            value: geoCoordMap[dataItem.target].concat([dataItem.value]),
          };
        }
      });
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
      const series = this.options.series;
      series[0]["data"] = this.convertData(val);
      series[1]["data"] = this.convertData(val);
      series[2]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.source,
            value: geoCoordMap[dataItem.source].concat([dataItem.value]),
          };
        }
      });
      series[3]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.target,
            value: geoCoordMap[dataItem.target].concat([dataItem.value]),
          };
        }
      });
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
