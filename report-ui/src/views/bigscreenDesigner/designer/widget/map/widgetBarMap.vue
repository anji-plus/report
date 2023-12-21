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
import {conversionProvince} from "@/utils/china";
import echarts from "echarts";

let geoCoordMap = conversionProvince;

export default {
  name: "widgetBarMap",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        title: {
          show: true,
        },
        //backgroundColor: '#131C38',
        tooltip: {
          trigger: 'item',
          show: true,
          enterable: true,
          textStyle: {
            fontSize: 20,
            color: '#fff'
          },
          backgroundColor: 'rgba(0,2,89,0.8)',
          formatter: function (params, ticket, callback) {
            if (params.seriesType == "scatter") {
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
          layoutSize: "80%",
          label: {
            emphasis: {
              show: false,
              color: "white",
            },
          },
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
          // 柱状体的主干
          {
            type: 'lines',
            zlevel: 1,
            effect: {
              show: false,
              symbolSize: 5 // 图标大小
            },
            lineStyle: {
              width: 20, // 尾迹线条宽度
              color: 'rgb(22,255,255, .6)',
              opacity: 1, // 尾迹线条透明度
              curveness: 0 // 尾迹线条曲直度
            },
            silent: true,
            data: []
          },
          // 柱状体的顶部
          {
            type: 'scatter',
            coordinateSystem: 'geo',
            //geoIndex: 0,
            zlevel: 1,
            rippleEffect: {
              brushType: "stroke",
            },
            label: {
              show: true,
              formatter: function (params) {
                return "{cnNum|" + params.data[2] + "}";
              },
              rich: {
                cnNum: {
                  // 数值字号
                  fontSize: 13,
                  color: "#D4EEFF",
                },
              },
              position: "top"
            },
            symbol: 'circle',
            symbolSize: [20, 10],
            itemStyle: {
              color: 'rgb(22,255,255, 1)',
              opacity: 1
            },
            silent: true,
            data: []
          },
          // 柱状体的底部
          {
            type: 'scatter',
            coordinateSystem: 'geo',
            rippleEffect: {
              brushType: "stroke",
            },
            //geoIndex: 0,
            zlevel: 1,
            label: {
              // 这儿是处理的
              formatter: '{b}',
              position: 'bottom',
              color: '#fff',
              fontSize: 12,
              distance: 10,
              show: true
            },
            symbol: 'circle',
            symbolSize: [20, 10],
            itemStyle: {
              // color: '#F7AF21',
              color: 'rgb(22,255,255, 1)',
              opacity: 1
            },
            silent: true,
            data: []
          },
          // 底部外框
          {
            type: 'scatter',
            coordinateSystem: 'geo',
            //geoIndex: 0,
            rippleEffect: {
              brushType: "stroke",
            },
            zlevel: 1,
            label: {
              show: false
            },
            symbol: 'circle',
            symbolSize: [40, 20],
            itemStyle: {
              color: {
                type: 'radial',
                x: 0.5,
                y: 0.5,
                r: 0.5,
                colorStops: [
                  {
                    offset: 0, color: 'rgb(22,255,255, 0)' // 0% 处的颜色
                  },
                  {
                    offset: .75, color: 'rgb(22,255,255, 0)' // 100% 处的颜色
                  },
                  {
                    offset: .751, color: 'rgb(22,255,255, 1)' // 100% 处的颜色
                  },
                  {
                    offset: 1, color: 'rgb(22,255,255, 1)' // 100% 处的颜色
                  }
                ],
                global: false // 缺省为 false
              },
              opacity: 1
            },
            silent: true,
            data: []
          }
        ]
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
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑

  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsGeo();
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
    // 计算柱图的高度比例
    calMaxHeight(val, heightRate) {
      const maxValue = Math.max.apply(null, val.map(item => item.value))
      return heightRate / maxValue;
    },
    // 计算柱体的主干
    calScatterTrunk(val, heightRate) {
      return val.map((item) => {
        return {
          coords: [geoCoordMap[item.name], [geoCoordMap[item.name][0], geoCoordMap[item.name][1] + item.value * this.calMaxHeight(val, heightRate)]]
        }
      })
    },
    // 计算柱体顶部
    calScatterTop(val, heightRate) {
      return val.map((item) => {
        return [geoCoordMap[item.name][0], geoCoordMap[item.name][1] + item.value * this.calMaxHeight(val, heightRate), item.value]
      })
    },
    // 计算柱体的底部
    calScatterBottom(val) {
      return val.map((item) => {
        return {
          name: item.name,
          value: geoCoordMap[item.name]
        }
      })
    },
    // 柱体主干
    getOptionsBarTrunk(optionsSetup, arrColor, allData, heightRate) {
      const barTrunk = {
        type: 'lines',
        zlevel: 1,
        effect: {
          show: false,
          symbolSize: 5 // 图标大小
        },
        lineStyle: {
          width: optionsSetup.barWidth, // 尾迹线条宽度
          color: (params) => {
            return arrColor[params.dataIndex];
          },
          opacity: 1, // 尾迹线条透明度
          curveness: 0 // 尾迹线条曲直度
        },
        silent: true,
        data: this.calScatterTrunk(allData, heightRate),
      };
      return barTrunk;
    },
    // 柱体顶
    getOptionsBarTop(optionsSetup, arrColor, allData, heightRate) {
      const barTop = {
        type: 'scatter',
        coordinateSystem: 'geo',
        //geoIndex: 0,
        zlevel: 1,
        rippleEffect: {
          brushType: "stroke",
        },
        label: {
          show: optionsSetup.isShowFontData,
          formatter: function (params) {
            return "{cnNum|" + params.data[2] + "}";
          },
          rich: {
            cnNum: {
              // 数值字号
              fontSize: optionsSetup.fontDataSize,
              color: (params) => {
                return arrColor[params.dataIndex];
              },
              fontWeight: optionsSetup.fontDataWeight,
              fontStyle: optionsSetup.fontDataStyle,
              fontFamily: optionsSetup.fontDataFamily,
            },
          },
          position: "top"
        },
        symbol: 'circle',
        symbolSize: [optionsSetup.barWidth, 10],
        itemStyle: {
          color: (params) => {
            return arrColor[params.dataIndex];
          },
          opacity: 1
        },
        silent: true,
        data: this.calScatterTop(allData, heightRate)
      }
      return barTop;
    },
    // 柱底
    getOptionsBarBottom(optionsSetup, arrColor, allData) {
      const batBottom = {
        type: 'scatter',
        coordinateSystem: 'geo',
        rippleEffect: {
          brushType: "stroke",
        },
        //geoIndex: 0,
        zlevel: 1,
        label: {
          // 这儿是处理的
          show: optionsSetup.isShowFontText,
          formatter: '{b}',
          position: 'bottom',
          fontSize: optionsSetup.fontTextSize,
          color: (params) => {
            return arrColor[params.dataIndex];
          },
          fontWeight: optionsSetup.fontTextWeight,
          fontStyle: optionsSetup.fontTextStyle,
          fontFamily: optionsSetup.fontTextFamily,
          distance: 10,
        },
        symbol: 'circle',
        symbolSize: [optionsSetup.barWidth, 10],
        itemStyle: {
          color: (params) => {
            return arrColor[params.dataIndex];
          },
          opacity: 1,
        },
        silent: true,
        data: this.calScatterBottom(allData),
      }
      return batBottom;
    },
    // 柱底外圆
    getOptionsBarBottomOut(optionsSetup, arrColor, allData) {
      const barBottomOut = {
        type: 'scatter',
        coordinateSystem: 'geo',
        //geoIndex: 0,
        rippleEffect: {
          brushType: "stroke",
        },
        zlevel: 1,
        label: {
          show: false
        },
        symbol: 'circle',
        symbolSize: [optionsSetup.barBottomOutSymbolSize, 10],
        // 渐变色
        itemStyle: {
          color: (params) => {
            return {
              type: 'radial',
              x: 0.5,
              y: 0.5,
              r: 0.5,
              colorStops: [
                {
                  offset: 0, color: 'rgba(22,255,255, 0)' // 0% 处的颜色
                },
                {
                  offset: .75, color: 'rgba(22,255,255, 0)' // 100% 处的颜色
                },
                {
                  offset: .751, color: arrColor[params.dataIndex] // 100% 处的颜色
                },
                {
                  offset: 1, color: arrColor[params.dataIndex] // 100% 处的颜色
                }
              ],
              global: false // 缺省为 false
            }
          },
          opacity: 1,
        },
        silent: true,
        data: this.calScatterBottom(allData),
      }
      return barBottomOut;
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
      let name = [];
      let latitude = [];
      let longitude = [];
      let value = [];
      for (const i in val) {
        name[i] = val[i].name;
        latitude[i] = val[i].latitude;
        longitude[i] = val[i].longitude;
        value[i] = val[i].value;
      }
      let allData = [];
      for (const i in name) {
        geoCoordMap[name[i]] = [latitude[i], longitude[i]]
        const obj = {
          name: name[i],
          value: value[i]
        }
        allData.push(obj)
      }
      const optionsSetup = this.optionsSetup;
      const heightRate = optionsSetup.heightRate;
      // 颜色设置
      const customColor = optionsSetup.customColor;
      if (!customColor) return;
      const arrColor = [];
      for (const i in val) {
        arrColor.push(customColor[i % customColor.length].color)
      }
      this.options.series[1] = this.getOptionsBarTrunk(optionsSetup, arrColor, allData, heightRate);
      this.options.series[2] = this.getOptionsBarTop(optionsSetup, arrColor, allData, heightRate);
      this.options.series[3] = this.getOptionsBarBottom(optionsSetup, arrColor, allData);
      this.options.series[4] = this.getOptionsBarBottomOut(optionsSetup, arrColor, allData);
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
      let name = [];
      let latitude = [];
      let longitude = [];
      let value = [];
      for (const i in val) {
        name[i] = val[i].name;
        latitude[i] = val[i].latitude;
        longitude[i] = val[i].longitude;
        value[i] = val[i].value;
      }
      for (const i in val) {
        name[i] = val[i].name;
        latitude[i] = val[i].latitude;
        longitude[i] = val[i].longitude;
        value[i] = val[i].value;
      }
      let allData = [];
      for (const i in name) {
        geoCoordMap[name[i]] = [latitude[i], longitude[i]]
        const obj = {
          name: name[i],
          value: value[i]
        }
        allData.push(obj)
      }
      const optionsSetup = this.optionsSetup;
      const heightRate = optionsSetup.heightRate;
      // 颜色设置
      const customColor = optionsSetup.customColor;
      if (!customColor) return;
      const arrColor = [];
      for (const i in val) {
        arrColor.push(customColor[i % customColor.length].color)
      }
      this.$set(this.options.series, 1, this.getOptionsBarTrunk(optionsSetup, arrColor, allData, heightRate))
      this.$set(this.options.series, 2, this.getOptionsBarTop(optionsSetup, arrColor, allData, heightRate))
      this.$set(this.options.series, 3, this.getOptionsBarBottom(optionsSetup, arrColor, allData))
      this.$set(this.options.series, 4, this.getOptionsBarBottomOut(optionsSetup, arrColor, allData))
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
