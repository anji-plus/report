<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>

<script>
export default {
  name: "widgetPiePercentageChart",//百分比图参考：https://www.makeapie.com/editor.html?c=xFkzKG-bpl
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      angle: 0,
      options: {
        //backgroundColor: '#061740',
        title: {
          text: '{nums|' + this.value2() + '}{percent|%}',
          x: 'center',
          y: 'center',
          textStyle: {
            rich: {
              nums: {
                fontSize: 60,
                color: '#29EEF3',
              },
              percent: {
                fontSize: 30,
                color: '#ffffff',
              },
            },
          },
        },
        legend: {
          type: 'plain',
          orient: 'vertical',
          right: 0,
          top: '10%',
          align: 'auto',
          data: [{
            name: '1',
            icon: "circle"
          }, {
            name: '2',
            icon: "circle"
          }, {
            name: '3',
            icon: "circle"
          }, {
            name: '4',
            icon: "circle"
          }],
          textStyle: {
            color: 'white',
            fontSize: 16,
            padding: [10, 1, 10, 0],
          },
          selectedMode: false,
        },
        series: [
          {
            //name: 'ring5',
            type: 'custom',
            coordinateSystem: 'none',
            renderItem: (params, api) => {
              return {
                type: 'arc',
                shape: {
                  cx: api.getWidth() / 2,
                  cy: api.getHeight() / 2,
                  r: (Math.min(api.getWidth(), api.getHeight()) / 2) * 0.6,
                  startAngle: ((0 + this.angle) * Math.PI) / 180,
                  endAngle: ((90 + this.angle) * Math.PI) / 180,
                },
                style: {
                  stroke: '#0CD3DB',
                  fill: 'transparent',
                  lineWidth: 1.5,
                },
                silent: true,
              };
            },
            data: [0],
          },
          {
            //name: 'ring5',
            type: 'custom',
            coordinateSystem: 'none',
            renderItem: (params, api) => {
              return {
                type: 'arc',
                shape: {
                  cx: api.getWidth() / 2,
                  cy: api.getHeight() / 2,
                  r: (Math.min(api.getWidth(), api.getHeight()) / 2) * 0.6,
                  startAngle: ((180 + this.angle) * Math.PI) / 180,
                  endAngle: ((270 + this.angle) * Math.PI) / 180,
                },
                style: {
                  stroke: '#0CD3DB',
                  fill: 'transparent',
                  lineWidth: 1.5,
                },
                silent: true,
              };
            },
            data: [0],
          },
          {
            //name: 'ring5',
            type: 'custom',
            coordinateSystem: 'none',
            renderItem: (params, api) => {
              return {
                type: 'arc',
                shape: {
                  cx: api.getWidth() / 2,
                  cy: api.getHeight() / 2,
                  r: (Math.min(api.getWidth(), api.getHeight()) / 2) * 0.65,
                  startAngle: ((270 + -this.angle) * Math.PI) / 180,
                  endAngle: ((40 + -this.angle) * Math.PI) / 180,
                },
                style: {
                  stroke: '#0CD3DB',
                  fill: 'transparent',
                  lineWidth: 1.5,
                },
                silent: true,
              };
            },
            data: [0],
          },
          {
            //name: 'ring5',
            type: 'custom',
            coordinateSystem: 'none',
            renderItem: (params, api) => {
              return {
                type: 'arc',
                shape: {
                  cx: api.getWidth() / 2,
                  cy: api.getHeight() / 2,
                  r: (Math.min(api.getWidth(), api.getHeight()) / 2) * 0.65,
                  startAngle: ((90 + -this.angle) * Math.PI) / 180,
                  endAngle: ((220 + -this.angle) * Math.PI) / 180,
                },
                style: {
                  stroke: '#0CD3DB',
                  fill: 'transparent',
                  lineWidth: 1.5,
                },
                silent: true,
              };
            },
            data: [0],
          },
          {
            //name: 'ring5',
            type: 'custom',
            coordinateSystem: 'none',
            renderItem: (params, api) => {
              let x0 = api.getWidth() / 2;
              let y0 = api.getHeight() / 2;
              let r = (Math.min(api.getWidth(), api.getHeight()) / 2) * 0.65;
              let point = this.getCirlPoint(x0, y0, r, 90 + -this.angle);
              return {
                type: 'circle',
                shape: {
                  cx: point.x,
                  cy: point.y,
                  r: 4,
                },
                style: {
                  stroke: '#0CD3DB', //粉
                  fill: '#0CD3DB',
                },
                silent: true,
              };
            },
            data: [0],
          },
          {
            name: 'ring5', //绿点
            type: 'custom',
            coordinateSystem: 'none',
            renderItem: (params, api) => {
              let x0 = api.getWidth() / 2;
              let y0 = api.getHeight() / 2;
              let r = (Math.min(api.getWidth(), api.getHeight()) / 2) * 0.65;
              let point = this.getCirlPoint(x0, y0, r, 270 + -this.angle);
              return {
                type: 'circle',
                shape: {
                  cx: point.x,
                  cy: point.y,
                  r: 4,
                },
                style: {
                  stroke: '#0CD3DB', //绿
                  fill: '#0CD3DB',
                },
                silent: true,
              };
            },
            data: [0],
          },
          {
            name: 'ring5',
            type: 'pie',
            radius: ['58%', '45%'],
            silent: true,
            clockwise: true,
            startAngle: 90,
            z: 0,
            zlevel: 0,
            label: {
              normal: {
                position: 'center',
              },
            },
            data: [
              {
                value: this.value2(),
                name: '',
                itemStyle: {
                  normal: {
                    color: {
                      // 完成的圆环的颜色
                      colorStops: [
                        {
                          offset: 0,
                          color: '#4FADFD', // 0% 处的颜色
                        },
                        {
                          offset: 1,
                          color: '#28E8FA', // 100% 处的颜色
                        },
                      ],
                    },
                  },
                },
              },
              {
                value: 100 - this.value2(),
                name: '',
                label: {
                  normal: {
                    show: false,
                  },
                },
                itemStyle: {
                  normal: {
                    color: '#173164',
                  },
                },
              },
            ],
          },
          {
            name: '',
            type: 'gauge',
            radius: '58%',
            center: ['50%', '50%'],
            startAngle: 0,
            endAngle: 359.9,
            splitNumber: 8,
            hoverAnimation: true,
            axisTick: {
              show: false,
            },
            splitLine: {
              length: 60,
              lineStyle: {
                width: 5,
                color: '#061740',
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
                name: '',
              },
            ],
          },
        ],
      },
      /*    optionsStyle: {}, // 样式
            optionsData: {}, // 数据
            optionsCollapse: {}, // 图标属性
            optionsSetup: {}*/
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
        background: this.optionsSetup.background
      };
    }
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
      deep: true
    }
  },
  created() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.collapse;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
  },
  mounted() {
/*    setInterval(() => {
      //this.angle = this.angle + 3
      //myChart.setOption(option,true)
    }, 100);*/
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
       this.setOptionsTitle();
      // this.setOptionsValue();
      // this.setOptionsTooltip();
      // this.setOptionsLegend();
      // this.setOptionsColor();
      // this.setOptionsData();

    },
    //轴point设置
    getCirlPoint(x0, y0, r, x) {
      let x1 = x0 + r * Math.cos((x * Math.PI) / 180);
      let y1 = y0 + r * Math.sin((x * Math.PI) / 180);
      return {
        x: x1,
        y: y1,
      };
    },
    value2(){
      return 50;
    },
    // 标题设置
    setOptionsTitle() {
      const optionsCollapse = this.optionsSetup;
      const title = {};
      title.show = optionsCollapse.isNoTitle;
      title.text = optionsCollapse.titleText;
      title.left = optionsCollapse.textAlign;
      title.textStyle = {
        color: optionsCollapse.textColor,
        fontSize: optionsCollapse.textFontSize,
        fontWeight: optionsCollapse.textFontWeight
      };
      title.subtext = optionsCollapse.subText;
      title.subtextStyle = {
        color: optionsCollapse.subTextColor,
        fontWeight: optionsCollapse.subTextFontWeight,
        fontSize: optionsCollapse.subTextFontSize
      };

      this.options.title = title;
    },
    // 数值设定
    setOptionsValue() {
      const optionsCollapse = this.optionsSetup;
      const series = this.options.series;
      const numberValue = optionsCollapse.numberValue ? "{c}" : "";
      const percentage = optionsCollapse.percentage ? "({d})%" : "";
      const label = {
        show: optionsCollapse.isShow,
        formatter: `{a|{b}：${numberValue} ${percentage}}`,
        rich: {
          a: {
            padding: [-30, 15, -20, 15],
            color: optionsCollapse.subTextColor,
            fontSize: optionsCollapse.fontSize,
            fontWeight: optionsCollapse.fontWeight
          }
        },
        fontSize: optionsCollapse.fontSize,

        fontWeight: optionsCollapse.optionsCollapse
      };
      for (const key in series) {
        if (series[key].type == "pie") {
          series[key].label = label;
          series[key].labelLine = {show: optionsCollapse.isShow};
        }
      }
    },
    // 提示语设置 tooltip
    setOptionsTooltip() {
      const optionsCollapse = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        show: true,
        textStyle: {
          color: optionsCollapse.lineColor,
          fontSize: optionsCollapse.fontSize
        }
      };
      this.options.tooltip = tooltip;
    },
    // 图例操作 legend
    setOptionsLegend() {
      const optionsCollapse = this.optionsSetup;
      const legend = this.options.legend;
      legend.show = optionsCollapse.isShowLegend;
      legend.left = optionsCollapse.lateralPosition == "left" ? 0 : "auto";
      legend.right = optionsCollapse.lateralPosition == "right" ? 0 : "auto";
      legend.top = optionsCollapse.longitudinalPosition == "top" ? 0 : "auto";
      legend.bottom =
        optionsCollapse.longitudinalPosition == "bottom" ? 0 : "auto";
      legend.orient = optionsCollapse.layoutFront;
      legend.textStyle = {
        color: optionsCollapse.lengedColor,
        fontSize: optionsCollapse.fontSize
      };
      legend.itemWidth = optionsCollapse.lengedWidth;
    },
    // 图例颜色修改
    setOptionsColor() {
      const optionsCollapse = this.optionsSetup;
      const customColor = optionsCollapse.customColor;
      if (!customColor) return;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      this.options.color = arrColor;
      this.options = Object.assign({}, this.options);
    },
    setOptionsData() {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const staticData = JSON.parse(val);
      for (const key in this.options.series) {
        if (this.options.series[key].type == "pie") {
          this.options.series[key].data = staticData;
        }
      }
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
      data.then(res => {
        this.renderingFn(res);
      });
    },
    renderingFn(val) {
      for (const key in this.options.series) {
        if (this.options.series[key].type == "pie") {
          this.options.series[key].data = val;
        }
      }
    }
  }
};
</script>

<style scoped lang="scss">
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
