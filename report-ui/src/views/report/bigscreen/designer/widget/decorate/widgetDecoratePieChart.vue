<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>

<script>
export default {
  name: "widgetRotatePieChart",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        title: {},
        series: [
          {
            name: '外环1',
            type: 'pie',
            zlevel: 1,
            silent: true,
            radius: ['98%', '97%'],
            hoverAnimation: false,
            color: "#46d3f3",
            //color: "rgba(88,142,197,0.5)",
            // animation:false,    //charts3 no
            label: {
              normal: {
                show: false
              },
            },
            labelLine: {
              normal: {
                show: false
              }
            },
            data: [1]
          },
          {
            type: 'pie',
            zlevel: 2,
            silent: true,
            radius: ['90%', '91%'],
            startAngle: 50,
            hoverAnimation: false,
            // animation:false,    //charts3 no
            label: {
              normal: {
                show: false
              },
            },
            labelLine: {
              normal: {
                show: false
              }
            },
            data: this.pie2()
          },
          {
            type: 'pie',
            zlevel: 3,
            silent: true,
            radius: ['88%', '87%'],
            label: {
              normal: {
                show: false
              },
            },
            labelLine: {
              normal: {
                show: false
              }
            },
            data: this.pie2()
          },
          {
            type: 'pie',
            zlevel: 4,
            silent: true,
            radius: ['84%', '83%'],
            label: {
              normal: {
                show: false
              },
            },
            labelLine: {
              normal: {
                show: false
              }
            },
            data: this.pie3()
          },
          {
            type: 'pie',
            zlevel: 5,
            silent: true,
            radius: ['80%', '78%'],
            color: ["#fc8d89", "#46d3f3", "rgba(203,203,203,.2)"],
            startAngle: 50,
            hoverAnimation: false,
            // animation:false,    //charts3 no
            label: {
              normal: {
                show: false
              },
            },
            data: [50, 20, 40]
          },
          {
            name: "",
            type: 'gauge',
            splitNumber: 30, //刻度数量
            min: 0,
            max: 100,
            radius: '73%', //图表尺寸
            center: ['50%', '50%'],
            startAngle: 90,
            endAngle: -269.9999,
            axisLine: {
              show: false,
              lineStyle: {
                width: 0,
                shadowBlur: 0,
                color: [
                  [1, '#0dc2fe']
                ]
              }
            },
            axisTick: {
              show: false,
              lineStyle: {
                color: 'auto',
                width: 2
              },
              length: 20,
              splitNumber: 5
            },
            splitLine: {
              show: true,
              length: 32,
              lineStyle: {
                color: 'auto',
              }
            },
            axisLabel: {
              show: false
            },
            pointer: { //仪表盘指针
              show: 0,
            },
            detail: {
              show: 0,
            },
          },
          {
            //name: '统计',
            type: 'gauge',
            splitNumber: 30, //刻度数量
            min: 0,
            max: 100,
            radius: '68%', //图表尺寸
            center: ['50%', '50%'],
            startAngle: 90,
            endAngle: -269.9999,
            axisLine: {
              show: true,
              lineStyle: {
                width: 0,
                shadowBlur: 0,
                color: [
                  [0, '#0dc2fe'],
                  [1, '#0dc2fe']
                ]
              }
            },
            axisTick: {
              show: true,
              lineStyle: {
                color: '#0dc2fe',
                width: 2
              },
              length: 20,
              splitNumber: 5
            },
            splitLine: {
              show: true,
              length: 20,
              lineStyle: {
                color: '#0dc2fe',
              }
            },
            axisLabel: {
              show: false
            },
            pointer: { //仪表盘指针
              show: 0,
            },
            detail: {
              show: false,
              borderColor: '#fff',
              shadowColor: '#fff', //默认透明
              shadowBlur: 2,
              offsetCenter: [0, '0%'], // x, y，单位px
              textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#fff',
                fontSize: 50,
              },
              formatter: '{value}'
            },
            data: []
          },
          {
            type: 'pie',
            zlevel: 20,
            silent: true,
            radius: ['60%', '59%'],
            hoverAnimation: false,
            color: '#2dc0c9',
            // animation:false,
            //data: [1],
            labelLine: {
              normal: {
                show: false
              }
            }
          },
          {
            name: '中间环形图',
            type: 'pie',
            radius: ['35%', '55%'],
            avoidLabelOverlap: false,
            hoverAnimation: false,
            itemStyle: {
              normal: {
                color: '#80ADD2',
                borderColor: '#3D4268',
              }
            },
            label: {
              normal: {
                show: false,
                position: 'center',

              },
              emphasis: {
                show: true,
                textStyle: {
                  fontSize: '30',
                  fontWeight: 'bold'
                }
              }
            },
            labelLine: {
              normal: {
                show: false
              }
            },
            data: [
              25, 25, 25, 25, 25, 25
            ]
          },
        ]
      },
      optionsStyle: {}, // 样式
      optionsCollapse: {}, // 图标属性
      optionsSetup: {}
    }
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
        this.optionsCollapse = val.setup;
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true
    }
  },
  mounted() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.setup;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
  },
  methods: {
    pie2() {
      let dataArr = [];
      for (var i = 0; i < 8; i++) {
        if (i % 2 === 0) {
          dataArr.push({
            name: (i + 1).toString(),
            value: 25,
            itemStyle: {
              normal: {
                color: "rgba(88,142,197,0.5)",
                borderWidth: 0,
                borderColor: "rgba(0,0,0,0)"
              }
            }
          })
        } else {
          dataArr.push({
            name: (i + 1).toString(),
            value: 20,
            itemStyle: {
              normal: {
                color: "rgba(0,0,0,0)",
                borderWidth: 0,
                borderColor: "rgba(0,0,0,0)"
              }
            }
          })
        }

      }
      return dataArr
    },
    pie3() {
      let dataArr = [];
      for (var i = 0; i < 100; i++) {
        if (i % 2 === 0) {
          dataArr.push({
            name: (i + 1).toString(),
            value: 25,
            itemStyle: {
              normal: {
                color: "rgb(126,190,255)",
                borderWidth: 0,
                borderColor: "rgba(0,0,0,0)"
              }
            }
          })
        } else {
          dataArr.push({
            name: (i + 1).toString(),
            value: 20,
            itemStyle: {
              normal: {
                color: "rgba(0,0,0,0)",
                borderWidth: 0,
                borderColor: "rgba(0,0,0,0)"
              }
            }
          })
        }

      }
      return dataArr
    },
    editorOptions() {
      //this.setOptionsTitle();
    },
    // 标题修改
    setOptionsTitle() {
      const optionsCollapse = this.optionsSetup;
      const title = {};
      title.text = optionsCollapse.titleText;
      title.show = optionsCollapse.isNoTitle;
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
  }
}
</script>

<style scoped lang="scss">
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
