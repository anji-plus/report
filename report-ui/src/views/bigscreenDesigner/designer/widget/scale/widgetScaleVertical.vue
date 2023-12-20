<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import echarts from "echarts";
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

let scale = [];
let max;
let min;

// 竖刻度尺
export default {
  name: "widgetScaleVertical",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        yAxis: [
          {
            // 对底部高度有影响
            show: true,
            data: [],
            min: 0,
            max: max,
            axisLine: {
              show: false
            }
          },
          {
            show: false,
            min: 0,
            max: max,
          },
          {
            type: 'category',
            position: 'left',
            offset: -5,
            axisLabel: {
              fontSize: 10,
              color: 'white'
            },
            axisLine: {
              show: false
            },
            axisTick: {
              show: false
            },
          }
        ],
        xAxis: [
          // 宽度
          {
            show: false,
            min: -10,
            max: 10,
            data: []
          },
          {
            show: false,
            min: -10,
            max: 10,
            data: []
          },
          {
            show: false,
            min: -10,
            max: 10,
            data: []
          },
          { // 刻度位置
            show: false,
            min: -3,
            max: 10,
            splitLine: {
              lineStyle: {
                color: 'rgba(56, 128, 138,1)',
              }
            }
          }
        ],
        series: [
          {
            name: "值",
            type: "bar",
            barWidth: 35,
            xAxisIndex: 0,
            itemStyle: {
              normal: {
                color: "#0C2F6F",
                barBorderRadius: 50,
              }
            },
            z: 2,
            data: [
              {
                label: {
                  normal: {
                    show: true,
                    position: "top",
                    backgroundColor: {},
                    width: 10,
                    height: 50,
                    rich: {
                      back: {
                        align: 'center',
                        lineHeight: 50,
                        fontSize: 16,
                        fontFamily: 'digifacewide',
                      },
                    }
                  }
                }
              }
            ],
          },
          {
            name: '白框',
            type: 'bar',
            xAxisIndex: 1,
            barGap: '-100%',
            data: [max - 1],
            barWidth: 35,
            itemStyle: {
              normal: {
                color: '#0C2F6F',
                barBorderRadius: 50,
              }
            },
            z: 1
          },
          {
            name: '外框',
            type: 'bar',
            xAxisIndex: 2,
            barGap: '-100%',
            data: [max],
            barWidth: 45,
            itemStyle: {
              normal: {
                color: 'rgba(56, 128, 138,1)',
                barBorderRadius: 50,
              }
            },
            z: 0
          },
          {
            name: '刻度',
            type: 'bar',
            yAxisIndex: 0,
            xAxisIndex: 3,
            label: {
              normal: {
                show: true,
                position: 'left',
                distance: 10,
                color: 'rgba(56, 128, 138,1)',
                fontSize: 16,
                fontWeight: 'normal',
                formatter: function (params) {
                  if (params.dataIndex % 10 === 0) {
                    return params.dataIndex;
                  } else if (params.dataIndex == max) {
                    return params.dataIndex;
                  } else {
                    return ""
                  }
                }
              }
            },
            barGap: '-40%',
            data: scale,
            barWidth: 2,
            itemStyle: {
              normal: {
                color: 'rgba(56, 128, 138,1)',
              }
            },
            z: 0
          }
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
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsMaxScale();
      this.setOptionsYAxis();
      this.setOptionsScale();
      this.setOptionsOutBar();
      this.setOptionsMargin();
      this.setOptionsData();
      this.setOptionsInBar();
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
    // 最大刻度设置
    setOptionsMaxScale() {
      const optionsSetup = this.optionsSetup;
      max = optionsSetup.maxScale;
      scale = this.setScale(max);
    },
    setScale(max) {
      let scale = [];
      for (let i = 0; i <= max; i++) {
        if (i <= 0 || i >= max) {
          scale.push('-2')
        } else {
          if ((i - 10) % 20 === 0) {
            scale.push('-2');
          } else if ((i - 10) % 4 === 0) {
            scale.push('-1');
          } else {
            scale.push('');
          }
        }
      }
      return scale;
    },
    setOptionsYAxis() {
      this.options.yAxis[0].max = max;
      this.options.yAxis[1].max = max;
    },
    // 刻度设定
    setOptionsScale() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[3];
      // 刻度
      // 显示
      if (optionsSetup.isShowScale) {
        series.data = scale;
      } else {
        series.data = 0;
      }
      series.barWidth = optionsSetup.scaleBarWidth;
      series.itemStyle = {
        normal: {
          color: optionsSetup.scaleColor,
        }
      };
      //刻度值
      series.label = {
        normal: {
          show: true,
          position: 'left',
          distance: optionsSetup.scaleDistance,
          fontSize: optionsSetup.scaleFontSize,
          color: optionsSetup.scaleFontColor,
          fontWeight: optionsSetup.scaleFontWeight,
          fontStyle: optionsSetup.scaleFontStyle,
          fontFamily: optionsSetup.scaleFontFamily,
          formatter: function (params) {
            if (params.dataIndex % 10 === 0) {
              return params.dataIndex;
            } else if (params.dataIndex == max) {
              return params.dataIndex;
            } else {
              return ""
            }
          }
        }
      };
    },
    // 外框设置
    setOptionsOutBar() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[2];
      series.barWidth = optionsSetup.outBarWidth;
      series.itemStyle = {
        normal: {
          color: optionsSetup.outBarColor,
          barBorderRadius: optionsSetup.outBarRadius,
        }
      };
      series.data = [max];
    },
    // 内框设置
    setOptionsInBar() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[1];
      series.barWidth = optionsSetup.inBarWidth;
      series.itemStyle = {
        normal: {
          color: optionsSetup.inBarColor,
          barBorderRadius: optionsSetup.inBarRadius,
        }
      };
      series.data = [max - 1];
    },
    // 渐变色设置
    setOptionsColor(inputValue, inputMax) {
      const optionsSetup = this.optionsSetup;
      let gradient = [];
      if (inputValue > (inputMax * 0.7)) {
        gradient.push(
          {
            offset: 0,
            color: optionsSetup.bar0Color,
          },
          {
            offset: 0.3,
            color: optionsSetup.bar30Color,
          },
          {
            offset: 0.7,
            color: optionsSetup.bar70Color,
          },
          {
            offset: 1,
            color: optionsSetup.bar100Color,
          })
      } else if (inputValue > (inputMax * 0.3)) {
        gradient.push(
          {
            offset: 0,
            color: optionsSetup.bar0Color,
          },
          {
            offset: 0.5,
            color: optionsSetup.bar30Color,
          },
          {
            offset: 1,
            color: optionsSetup.bar70Color,
          })
      } else {
        gradient.push(
          {
            offset: 0,
            color: optionsSetup.bar0Color,
          },
          {
            offset: 1,
            color: optionsSetup.bar30Color,
          })
      }
      return gradient;
    },
    setShowValue(inputValue, inputMax) {
      let showValue = inputValue;
      if (inputValue > inputMax) {
        showValue = inputMax
      } else {
        if (inputValue < 0) {
          showValue = 0
        } else {
          showValue = inputValue
        }
      }
      return showValue;
    },
    // 边距设置
    setOptionsMargin() {
      const optionsSetup = this.optionsSetup;
      const grid = {
        left: optionsSetup.marginLeft,
        right: optionsSetup.marginRight,
        bottom: optionsSetup.marginBottom,
        top: optionsSetup.marginTop,
        containLabel: true,
      };
      this.options.grid = grid;
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
    // 静态数据
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      const num = val[0]["num"];
      // 渐变色
      const gradient = this.setOptionsColor(num, optionsSetup.maxScale);
      // 数值设定
      const series = this.options.series[0];
      const data = {
        value: this.setShowValue(num, optionsSetup.maxScale),
        label: {
          normal: {
            show: optionsSetup.isShow,
            position: optionsSetup.fontPosition,
            distance: optionsSetup.fontDistance,
            width: 10,
            height: 50,
            formatter: '{back| ' + num + ' }',
            rich: {
              back: {
                align: 'center',
                lineHeight: 50,
                fontSize: optionsSetup.fontSize,
                fontWeight: optionsSetup.fontWeight,
                color: gradient[gradient.length - 1].color,
                fontStyle: optionsSetup.fontStyle,
                fontFamily: optionsSetup.fontFamily,
              },
            }
          }
        }
      }
      series.barWidth = optionsSetup.inBarWidth;
      series.itemStyle = {
        normal: {
          color: new echarts.graphic.LinearGradient(0, 1, 0, 0, gradient),
          barBorderRadius: optionsSetup.inBarRadius,
        }
      };
      series.data[0] = data;
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
      const num = val[0].value;
      // 渐变色
      const gradient = this.setOptionsColor(num, optionsSetup.maxScale);
      // 数值设定
      const series = this.options.series[0];
      const data = {
        value: this.setShowValue(num, optionsSetup.maxScale),
        label: {
          normal: {
            show: optionsSetup.isShow,
            position: "top",
            distance: optionsSetup.fontDistance,
            width: 10,
            height: 50,
            formatter: '{back| ' + num + ' }',
            rich: {
              back: {
                align: 'center',
                lineHeight: 50,
                fontSize: optionsSetup.fontSize,
                fontWeight: optionsSetup.fontWeight,
                color: gradient[gradient.length - 1].color,
              },
            }
          }
        }
      }
      series.barWidth = optionsSetup.inBarWidth;
      series.itemStyle = {
        normal: {
          color: new echarts.graphic.LinearGradient(0, 1, 0, 0, gradient),
          barBorderRadius: optionsSetup.inBarRadius,
        }
      };
      series.data[0] = data;
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
