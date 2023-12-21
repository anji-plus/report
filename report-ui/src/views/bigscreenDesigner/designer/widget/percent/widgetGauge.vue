<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import echarts from "echarts";
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetGauge",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        series: [
          {
            type: "gauge",
            z: 100,
            axisLine: {
              lineStyle: {
                width: 10,
                color: [
                  [
                    0.3,
                    new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                      {
                        offset: 0,
                        color: "rgba(0, 237, 3,0.1)",
                      },
                      {
                        offset: 0.5,
                        color: "rgba(0, 237, 3,0.6)",
                      },
                      {
                        offset: 1,
                        color: "rgba(0, 237, 3,1)",
                      },
                    ]),
                  ],
                  [
                    0.7,
                    new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                      {
                        offset: 0,
                        color: "rgba(255, 184, 0,0.1)",
                      },
                      {
                        offset: 0.5,
                        color: "rgba(255, 184, 0,0.6)",
                      },
                      {
                        offset: 1,
                        color: "rgba(255, 184, 0,1)",
                      },
                    ]),
                  ],
                  [
                    1,
                    new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                      {
                        offset: 0,
                        color: "rgba(175, 36, 74,0.1)",
                      },
                      {
                        offset: 0.5,
                        color: "rgba(255, 36, 74,0.6)",
                      },
                      {
                        offset: 1,
                        color: "rgba(255, 36, 74,1)",
                      },
                    ]),
                  ],
                ],
              },
            },
            pointer: {
              itemStyle: {
                color: "auto",
              },
            },
            axisTick: {
              show: true,
              distance: 0,
              length: 10,
              lineStyle: {
                color: "auto",
                width: 2,
              },
            },
            splitLine: {
              show: true,
              distance: 0,
              length: 14,
              lineStyle: {
                color: "auto",
                width: 4,
              },
            },
            axisLabel: {
              show: true,
              color: "white",
              distance: 2,
              fontSize: 10,
            },
            detail: {
              valueAnimation: true,
              formatter: function (value) {
                const max = series[0].max; // 获取最大值
                const formattedValue = (value / max * 100).toFixed(0); // 计算格式化后的数值
                return formattedValue + ' %'; // 拼接百分号
              },
              color: "white",
              fontSize: 18,
            },
            data: [
              {
                value: 70,
              },
            ],
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
        this.optionsStyle = val.position; // 位置
        this.optionsData = val.data; // 数据
        this.optionsCollapse = val.collapse; // 折叠数据
        this.optionsSetup = val.setup; // 样式
        this.editorOptions();
      },
      deep: true,
    },
  },
  created() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.collapse;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
  },
  mounted() {
    targetWidgetLinkageLogic(this);
  },
  methods: {
    editorOptions() {
      this.setOptionsTitle();
      this.setOptions();
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
    setOptions() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      if (series[0].type == "gauge") {
        // 轴线相关
        const axisLine = {
          show: optionsSetup.ringShow,
          lineStyle: {
            width: optionsSetup.pieWeight,
            color: [
              [
                0.3,
                new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                  {
                    offset: 0,
                    color: optionsSetup.color30p0,
                  },
                  {
                    offset: 0.5,
                    color: optionsSetup.color30p5,
                  },
                  {
                    offset: 1,
                    color: optionsSetup.color30p10,
                  },
                ]),
              ],
              [
                0.7,
                new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                  {
                    offset: 0,
                    color: optionsSetup.color70p0,
                  },
                  {
                    offset: 0.5,
                    color: optionsSetup.color70p5,
                  },
                  {
                    offset: 1,
                    color: optionsSetup.color70p10,
                  },
                ]),
              ],
              [
                1,
                new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                  {
                    offset: 0,
                    color: optionsSetup.color100p0,
                  },
                  {
                    offset: 0.5,
                    color: optionsSetup.color100p5,
                  },
                  {
                    offset: 1,
                    color: optionsSetup.color100p10,
                  },
                ]),
              ],
            ],
          },
        };
        // 刻度线
        const axisTick = {
          show: optionsSetup.tickShow,
          splitNumber: optionsSetup.tickSplitNumber,
          //distance: optionsSetup.tickDistance, echartsV5.0.0开始支持
          length: optionsSetup.tickLength,
          lineStyle: {
            color: "auto",
            width: optionsSetup.tickWidth,
            type: optionsSetup.tickType,
          },
        };
        // 分隔线-指标线
        const splitLine = {
          show: optionsSetup.splitShow,
          // distance: optionsSetup.splitDistance,echartsV5.0.0开始支持
          length: optionsSetup.splitLength,
          lineStyle: {
            color: "auto",
            width: optionsSetup.splitWidth,
            type: optionsSetup.splitType,
          },
        };
        // 刻度标签
        const axisLabel = {
          show: optionsSetup.labelShow,
          color: optionsSetup.labelColor,
          distance: optionsSetup.labelDistance,
          fontSize: optionsSetup.labelFontSize,
          fontWeight: optionsSetup.labelFontWeight,
          fontStyle: optionsSetup.labelFontStyle,
          fontFamily: optionsSetup.labelFontFamily,
        };
        const detail = {
          show: optionsSetup.isShow,
          //valueAnimation: true, echartsV5.0.0开始支持
          formatter: function (value) {
            const max = series[0].max; // 获取最大值
            const formattedValue = (value / max * 100).toFixed(0); // 计算格式化后的数值
            // 拼接百分号
            if (optionsSetup.percentage) {
              return formattedValue + ' %';
            } else {
              return formattedValue;
            }
          },
          color: optionsSetup.detailColor,
          fontSize: optionsSetup.detailFontSize,
          fontWeight: optionsSetup.detailFontWeight,
          fontStyle: optionsSetup.detailFontStyle,
          fontFamily: optionsSetup.detailFontFamily,
        };
        series[0].axisLine = axisLine;
        series[0].axisTick = axisTick;
        series[0].splitLine = splitLine;
        series[0].axisLabel = axisLabel;
        series[0].detail = detail;
        series[0].max = optionsSetup.maxValue;
        series[0].startAngle = optionsSetup.startAngle;
        series[0].endAngle = optionsSetup.endAngle;
        series[0].clockwise = optionsSetup.clockwise;
      }
    },
    setOptionsData(e, paramsConfig) {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
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

      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const series = this.options.series;
      const num = val[0]["num"];
      const data = [
        {
          value: num,
        },
      ];
      series[0].data = data;
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
      const data = [
        {
          value: val[0].value,
        },
      ];
      series[0].data = data;
    },
  },
};
</script>

<style scoped lang="scss">
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
