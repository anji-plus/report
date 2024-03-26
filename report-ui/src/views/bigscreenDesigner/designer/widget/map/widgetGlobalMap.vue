<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize />
  </div>
</template>
<script>
import { targetWidgetLinkageLogic } from "@/views/bigscreenDesigner/designer/linkageLogic";
import "../../../../../../node_modules/echarts/map/js/world.js";
import { nameMap } from "@/utils/word";


export default {
  name: "widgetGlobalMap",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        xAxis: {
          axisLine: false,
        },
        yAxis: {
          axisLine: false,
        },
        title: {
          show: true,
        },
        tooltip: {
          trigger: "item",
          formatter: function (params) {
            console.log(params);
            let value=params.value
            if(isNaN(value)){
              value=0
            }
            return params.name + " : " + value;
          },
        },
        visualMap: {
          min: 0,
          max: 99999,
          text: ["高", "低"],
          color: ["#073684", "#061E3D"],
        },
        series: [
          {
            type: "map",
            mapType: "world",
            nameMap: nameMap,
            effect: {
              show: false,
              period: 6,
              trailLength: 0.7,
              color: "#fff",
              symbolSize: 3,
            },
            label: {
              normal: {
                position: "right",
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
              // 鼠标放置颜色加深
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
            data: [],
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
    console.log(this.value.setup);
    this.optionsSetup = this.value.setup;
    this.editorOptions();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsTooltip();
      this.setOptionsMap();
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
      };
      this.options.tooltip = {...this.options.tooltip,...tooltip};
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
          show: false,
        },
      };
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
      };
      let _nameMap=JSON.parse(JSON.stringify(nameMap))
      if(optionsSetup.customName&&optionsSetup.customName.length>0){
        for(var key in nameMap){
          for(let val of optionsSetup.customName){
            if(val['country']==nameMap[key]){
              _nameMap[key]=val.name
            }
          }
        }
        this.options.series[0].nameMap=_nameMap
      }else{
        this.options.series[0].nameMap=nameMap
      }
      this.options.visualMap.color=[optionsSetup.num100PreColor,optionsSetup.num0PreColor]
      this.options.series[0]["label"] = label;
      this.options.series[0]["itemStyle"] = itemStyle;
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
      this.options.series[0].data = val;
      const seriesData =this.options.series[0].data.map(({value})=> value);
        this.options.visualMap.max=Math.max(...seriesData)
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
      this.options.series[0].data = val;
      const seriesData =this.options.series[0].data.map(({value})=> value);
        this.options.visualMap.max=Math.max(...seriesData)
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
