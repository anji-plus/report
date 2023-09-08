<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>
<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

import "../../../../../../node_modules/echarts/map/js/china.js";
import {conversionProvince} from "@/utils/china";
import echarts from "echarts";

let geoCoordMap = conversionProvince;
let data = [
  {
    name: "北京市",
    value: 70,
  },
  {
    name: "天津市",
    value: 20,
  },
  {
    name: "上海市",
    value: 150,
  },
  {
    name: "重庆市",
    value: 75,
  },
  {
    name: "河北省",
    value: 40,
  },
  {
    name: "河南省",
    value: 83,
  },
  {
    name: "云南省",
    value: 50,
  },
  {
    name: "辽宁省",
    value: 49,
  },
  {
    name: "黑龙江省",
    value: 25,
  },
  {
    name: "湖南省",
    value: 69,
  },
  {
    name: "安徽省",
    value: 36,
  },
  {
    name: "山东省",
    value: 39,
  },
  {
    name: "新疆维吾尔自治区",
    value: 42,
  },
  {
    name: "江苏省",
    value: 42,
  },
  {
    name: "浙江省",
    value: 56,
  },
  {
    name: "江西省",
    value: 23,
  },
  {
    name: "湖北省",
    value: 98,
  },
  {
    name: "广西壮族自治区",
    value: 33,
  },
  {
    name: "宁夏回族自治区",
    value: 47,
  },
  {
    name: "山西省",
    value: 18,
  },
  {
    name: "内蒙古自治区",
    value: 57,
  },
  {
    name: "陕西省",
    value: 22,
  },
  {
    name: "吉林省",
    value: 44,
  },
  {
    name: "福建省",
    value: 36,
  },
  {
    name: "贵州省",
    value: 39,
  },
  {
    name: "广东省",
    value: 96,
  },
  {
    name: "青海省",
    value: 27,
  },
  {
    name: "西藏自治区",
    value: 31,
  },
  {
    name: "四川省",
    value: 46,
  }
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
        geo: [
          {
            map: "china",
            show: true,
            roam: false,
            layoutSize: "80%",
            label: {
              emphasis: {
                show: true,
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
                borderWidth: 3,
                shadowColor: "rgba(10,76,139,1)",
                shadowOffsetY: 0,
                shadowBlur: 60,
              },
            },
          }
        ],
        series: [
          {
            aspectScale: 0.75,
            type: 'map',
            map: 'china',
            roam: true,
            effect: {
              show: false,
              period: 6,
              trailLength: 0.7,
              color: "#fff",
              symbolSize: 3,
            },
            label: {
              normal: {
                //调整数值
                position: "right",
                // 地图省市区显隐
                show: false,
                color: "#53D9FF",
                fontSize: 20,
              },
              emphasis: {
                show: true,
              },
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
                      color: "#073684", // 0% 处的颜色
                    },
                    {
                      offset: 1,
                      color: "#061E3D", // 100% 处的颜色
                    },
                  ],
                },
                borderColor: "#215495",
                borderWidth: 1,
              },
              //鼠标放置颜色加深
              emphasis: {
                areaColor: {
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [
                    {
                      offset: 0,
                      color: "#073684", // 0% 处的颜色
                    },
                    {
                      offset: 1,
                      color: "#2B91B7", // 100% 处的颜色
                    },
                  ],
                },
              },
            },
            data: data
          },
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
            data: this.lineData(data)
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
            data: this.scatterData(data)
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
            data: this.scatterData2(data)
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
            data: convertData(data)
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
      this.setOptionsMap();
      this.setOptionsTooltip();
      this.setOptionsData();
    },
    // 标题设置
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {};
      title.text = optionsSetup.titleText;
      title.show = optionsSetup.isNoTitle;
      title.left = optionsSetup.textAlign;
      title.textStyle = {
        color: optionsSetup.textColor,
        fontSize: optionsSetup.textFontSize,
        fontWeight: optionsSetup.textFontWeight,
        fontStyle: optionsSetup.textFontStyle,
      };
      title.subtext = optionsSetup.subText;
      title.subtextStyle = {
        color: optionsSetup.subTextColor,
        fontWeight: optionsSetup.subTextFontWeight,
        fontSize: optionsSetup.subTextFontSize,
        fontStyle: optionsSetup.subTextFontStyle,
      };
      this.options.title = title;
    },
    // 地图设置
    setOptionsMap() {
      const optionsSetup = this.optionsSetup;
      const label = {
        normal: {
          //调整数值
          position: "right",
          // 地图省市区显隐
          show: optionsSetup.isShowMap,
          color: optionsSetup.colorMap,
          fontSize: optionsSetup.fontSizeMap,
        },
        emphasis: {
          show: true,
        },
      }
      const itemStyle = {
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
                color: optionsSetup.font0PreColor, // 0% 处的颜色
              },
              {
                offset: 1,
                color: optionsSetup.font100PreColor, // 100% 处的颜色
              },
            ],
          },
          borderColor: optionsSetup.borderColor,
          borderWidth: 1,
        },
        //鼠标放置颜色加深
        emphasis: {
          areaColor: {
            x: 0,
            y: 0,
            x2: 0,
            y2: 1,
            colorStops: [
              {
                offset: 0,
                color: "#073684", // 0% 处的颜色
              },
              {
                offset: 1,
                color: optionsSetup.fontHighlightColor, // 100% 处的颜色
              },
            ],
          },
        },
      }
      this.options.series[0]['label'] = label;
      this.options.series[0]['itemStyle'] = itemStyle;
    },
    // 柱形设置
    setOptionsBarTrunk() {
      const optionsSetup = this.optionsSetup;
      const lineStyle = {
        width: optionsSetup.barWidth,
        color: optionsSetup.barColor,
        opacity: 1, // 尾迹线条透明度
        curveness: 0 // 尾迹线条曲直度
      }
      this.options.series[1]['lineStyle'] = lineStyle;
    },
    setOptionsBarTop() {
      const optionsSetup = this.optionsSetup;
      // this.options.series[2]['symbolSize'] = [optionsSetup.barWidth, 10];
    },
    setOptionsBarBottom() {
      const optionsSetup = this.optionsSetup;
      /*      const label = {
              // 这儿是处理的
              show: optionsSetup.isShowFontText,
              formatter: '{b}',
              position: 'bottom',
              fontSize: optionsSetup.fontTextSize,
              color: optionsSetup.fontTextColor,
              fontWeight: optionsSetup.fontTextWeight,
              fontStyle: optionsSetup.fontTextStyle,
              distance: 10,
            };
            this.options.series[3]['label'] = label;*/
      //this.options.series[3]['symbolSize'] = [optionsSetup.barWidth, 10];
    },
    setOptionsBarBottomOut() {
      const optionsSetup = this.optionsSetup;
      // this.options.series[4]['symbolSize'] = [optionsSetup.barBottomOutSymbolSize, 10];
      const itemStyle = {
        color: {
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
              offset: .751, color: optionsSetup.barBottomOutColor // 100% 处的颜色
            },
            {
              offset: 1, color: optionsSetup.barBottomOutColor // 100% 处的颜色
            }
          ],
          global: false // 缺省为 false
        },
        opacity: 1
      };
      this.options.series[4]['itemStyle'] = itemStyle;
    },
    // 计算柱图的高度比例
    lineMaxHeight(val, heightRate) {
      const maxValue = Math.max.apply(null, val.map(item => item.value))
      return heightRate / maxValue;
    },
    // 柱体的主干
    lineData(val, heightRate) {
      return val.map((item) => {
        return {
          coords: [geoCoordMap[item.name], [geoCoordMap[item.name][0], geoCoordMap[item.name][1] + item.value * this.lineMaxHeight(val, heightRate)]]
        }
      })
    },
    // 柱体顶部
    scatterData(val, heightRate) {
      return val.map((item) => {
        return [geoCoordMap[item.name][0], geoCoordMap[item.name][1] + item.value * this.lineMaxHeight(val, heightRate), item.value]
      })
    },
    // 柱体的底部
    scatterData2(val) {
      return val.map((item) => {
        return {
          name: item.name,
          value: geoCoordMap[item.name]
        }
      })
    },
    // tooltip 设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        show: true,
        enterable: true,
        textStyle: {
          color: optionsSetup.tipsColor,
          fontSize: optionsSetup.tipsFontSize,
        },
        formatter: function (params) {
          if (params.seriesType == 'scatter') {
            return params.data.name + "" + params.data.value[2];
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
      // console.log(Object.keys(val[0]))
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
      const itemStyle = {
        color: (params) => {
          //console.log(params)
          return arrColor[params.dataIndex];
        },
        opacity: 1,
      };
      const lineStyle = {
        width: optionsSetup.barWidth,
        color: (params) => {
          //console.log(params)
          return arrColor[params.dataIndex];
        },
        opacity: 1, // 尾迹线条透明度
        curveness: 0 // 尾迹线条曲直度
      }

      const labelTop = {
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
          },
        },
        position: "top"
      };
      const labelBottom = {
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
        distance: 10,
      };
      // 渐变
      const itemStyle4 = {
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
      }
      this.options.series[1]['lineStyle'] = lineStyle;
      this.options.series[1].data = this.lineData(allData, heightRate);

      this.options.series[2]['symbolSize'] = [optionsSetup.barWidth, 10];
      this.options.series[2]['itemStyle'] = itemStyle;
      this.options.series[2]['label'] = labelTop;
      this.options.series[2].data = this.scatterData(allData, heightRate);

      this.options.series[3]['symbolSize'] = [optionsSetup.barWidth, 10];
      this.options.series[3]['itemStyle'] = itemStyle;
      this.options.series[3]['label'] = labelBottom;
      this.options.series[3].data = convertData(allData);

      this.options.series[4]['symbolSize'] = [optionsSetup.barBottomOutSymbolSize, 10];
      this.options.series[4]['itemStyle'] = itemStyle4;
      console.log(this.options)
      this.options.series[4].data = convertData(allData);
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
      this.options.series[0]["data"] = val;
      const optionsSetup = this.optionsSetup;
      const label = this.options.series[1]["label"];
      const normal = {
        show: true,
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
          },
        },
      };
      const data = convertData(val);
      this.options.series[1]["data"] = data;
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
