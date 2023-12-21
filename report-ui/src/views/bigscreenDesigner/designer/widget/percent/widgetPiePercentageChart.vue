<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

let per = 60;
export default {
  name: "widgetPiePercentageChart", //百分比图参考：https://www.makeapie.com/editor.html?c=xFkzKG-bpl
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
    widgetIndex: {
      type: Number,
      default: 0,
    }, // 当前组件，在工作区变量widgetInWorkbench中的索引
  },
  data() {
    return {
      angle: 0,
      options: {
        title: {
          text: "{nums|" + per + "}{percent|%}",
          x: "center",
          y: "center",
          textStyle: {
            rich: {
              nums: {
                fontSize: 60,
                color: "#29EEF3",
              },
              percent: {
                fontSize: 30,
                color: "#29EEF3",
              },
            },
          },
        },
        legend: {
          type: "plain",
          orient: "vertical",
          right: 0,
          top: "10%",
          align: "auto",
          data: [
            {
              name: "1",
              icon: "circle",
            },
            {
              name: "2",
              icon: "circle",
            },
            {
              name: "3",
              icon: "circle",
            },
            {
              name: "4",
              icon: "circle",
            },
          ],
          textStyle: {
            color: "white",
            fontSize: 16,
            padding: [10, 1, 10, 0],
          },
          selectedMode: false,
        },
        series: [
          {
            //name: '圆环',
            type: "pie",
            radius: ["58%", "45%"],
            silent: true,
            clockwise: true,
            startAngle: 90,
            z: 0,
            zlevel: 0,
            label: {
              normal: {
                position: "center",
              },
            },
            data: [
              {
                value: per,
                name: "",
                itemStyle: {
                  normal: {
                    color: {
                      // 完成的圆环的颜色
                      colorStops: [
                        {
                          offset: 0,
                          color: "#4FADFD", // 0% 处的颜色
                        },
                        {
                          offset: 1,
                          color: "#28E8FA", // 100% 处的颜色
                        },
                      ],
                    },
                  },
                },
              },
              {
                value: 100 - per,
                name: "",
                label: {
                  normal: {
                    show: false,
                  },
                },
                //剩余圆环颜色
                itemStyle: {
                  normal: {
                    color: "#173164",
                  },
                },
              },
            ],
          },
          {
            name: "percent",
            type: "gauge",
            radius: "58%",
            center: ["50%", "50%"],
            startAngle: 0,
            endAngle: 359.9,
            splitNumber: 8,
            hoverAnimation: true,
            axisTick: {
              show: false,
            },
            splitLine: {
              length: 15,
              lineStyle: {
                width: 5,
                color: "#061740",
              },
            },
            axisLabel: {
              show: false,
            },
            pointer: {
              show: false,
            },
            axisLine: {
              lineStyle: {
                opacity: 0,
              },
            },
            detail: {
              show: false,
            },
            data: [
              {
                value: 0,
                name: "",
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
        this.optionsStyle = val.position;
        this.optionsData = val.data;
        this.optionsCollapse = val.collapse;
        this.optionsSetup = val.setup;
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
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsColor();
      this.setOptionsData();
      this.setOptionLine();
      this.setOptionSurplusColor();
    },
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = this.options.title;
      title.x = "center";
      title.y = "center";
      const rich = {
        nums: {
          color: optionsSetup.textNumColor,
          fontSize: optionsSetup.textNumFontSize,
          fontWeight: optionsSetup.textNumFontWeight,
          fontStyle: optionsSetup.textNumFontStyle,
          fontFamily: optionsSetup.textNumFontFamily,
        },
        percent: {
          color: optionsSetup.textPerColor,
          fontSize: optionsSetup.textPerFontSize,
          fontWeight: optionsSetup.textPerFontWeight,
          fontStyle: optionsSetup.textPerFontStyle,
          fontFamily: optionsSetup.textPerFontFamily,
        },
      };
      title.textStyle["rich"] = rich;
      this.options.title = title;
    },
    //圆环0-100%颜色
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const itemStyle = this.options.series[0]["data"][0]["itemStyle"];
      const normal = {
        color: {
          // 完成的圆环的颜色
          colorStops: [
            {
              offset: 0,
              color: optionsSetup.color0Start, // 0% 处的颜色
            },
            {
              offset: 1,
              color: optionsSetup.color100End, // 100% 处的颜色
            },
          ],
        },
      };
      itemStyle["normal"] = normal;
    },
    setOptionSurplusColor() {
      const itemStyle = this.options.series[0]["data"][1]["itemStyle"];
      const normal = {
        color: this.optionsSetup.colorsurplus,
      };
      itemStyle["normal"] = normal;
    },
    setOptionLine() {
      const optionsSetup = this.optionsSetup;
      const line = this.options.series[1]["splitLine"];
      const num = this.options.series[1];
      num.splitNumber = optionsSetup.lineNumber;
      line.length = optionsSetup.lineLength;
      const lineStyle = {
        width: optionsSetup.lineWidth,
        color: optionsSetup.lineColor,
      };
      line["lineStyle"] = lineStyle;
    },
    // 数据解析
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
      const title = this.options.title;
      const num = val[0]["num"];
      title.text = "{nums|" + num + "}{percent|%}";
      this.options.series[0]["data"][0]["value"] = num;
      this.options.series[0]["data"][1]["value"] = 100 - num;
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
        this.options.title.text = "{nums|" + res[0].value + "}{percent|%}";
        this.options.series[0]["data"][0]["value"] = res[0].value;
        this.options.series[0]["data"][1]["value"] = 100 - res[0].value;
      });
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
