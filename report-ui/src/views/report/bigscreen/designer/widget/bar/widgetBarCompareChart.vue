<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>

<script>
export default {
  name: "WidgetBarCompareChart",
  //参考 https://www.makeapie.com/editor.html?c=xrJwcCF3NZ
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        title: {
          text: '柱状对比图',
          x: 'center',
          textStyle: {
            color: '#ffffff',
          },
        },
        grid: [
          {
            show: false,
            left: '4%',
            top: 60,
            bottom: 60,
            containLabel: true,
            width: '40%'
          },
          {//中间字体位置
            show: false,
            left: '50.5%',
            top: 60,
            bottom: 80,
            width: '0%'
          },
          {
            show: false,
            right: '4%',
            top: 60,
            bottom: 60,
            containLabel: true,
            width: '40%'
          },
        ],
        //图例
        legend: {
          data: ['success', 'fail'],
          bottom: 10,
          center: true,
          textStyle: {
            color: '#fff',
            textAlign: 'center'
          },
          //itemGap:80,
          //itemWidth: 0
        },
        xAxis: [
          {
            splitNumber: 2,//左间隔
            type: 'value',
            inverse: true,
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            position: 'bottom',
            axisLabel: {
              show: true,
              textStyle: {
                color: '#ffffff',
                fontSize: 12
              }
            },
            splitLine: {
              show: true,
              lineStyle: {
                color: '#57617f',
                width: 1,
                type: 'solid'
              }
            }
          },
          {
            gridIndex: 1,
            show: false,
          },
          {
            gridIndex: 2,
            type: 'value',
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            position: 'bottom',
            axisLabel: {
              show: true,
              textStyle: {
                color: '#ffffff',
                fontSize: 12,
              },
            },
            splitLine: {
              show: true,
              lineStyle: {
                color: '#57617f',
                width: 1,
                type: 'solid',
              },
            },
          },
        ],
        yAxis: [
          {
            type: 'category',
            inverse: true,
            position: 'right',
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false
            },
            axisLabel: {
              show: false,
            },
            data: [],
          },
          {//处理轴数据
            gridIndex: 1,
            type: 'category',
            inverse: true,
            position: 'left',
            axisLine: {
              show: false
            },
            axisTick: {
              show: false
            },
            axisLabel: {
              show: true,
              textStyle: {
                align: 'center',
                color: '#ffffff',
                fontSize: 14,
              }
            },
            data: [],
          },
          {
            gridIndex: 2,
            type: 'category',
            inverse: true,
            position: 'left',
            axisLine: {
              show: false
            },
            axisTick: {
              show: false
            },
            axisLabel: {
              show: false,
            },
          },
        ],
        series: [
          {
            name: '',
            type: 'bar',
            barGap: 20,
            barWidth: '80%',
            label: {
              normal: {
                show: true,
                color: 'red',
                position: 'insideLeft',
                textStyle: {
                  color: '#ffffff',
                }

              },
              emphasis: {
                show: false,
              },
            },
            itemStyle: {
              normal: {
                color: '#36c5e7',
                barBorderRadius: [8, 0, 0, 8],
              },
              /*emphasis: {
                show: false,
              },*/
            },
            data: [],
          },
          {
            name: '',
            type: 'bar',
            barGap: 20,
            barWidth: '80%',
            xAxisIndex: 2,
            yAxisIndex: 2,
            label: {
              normal: {
                show: true,
                color: 'red',
                position: 'insideRight',
                textStyle: {
                  color: '#ffffff',
                }
              },
            },
            itemStyle: {
              normal: {
                color: '#e68b55',
                barBorderRadius: [0, 8, 8, 0],
              },
              emphasis: {
                show: false,
              },
            },
            data: [],
          },
        ]
      },
      optionsStyle: {},
      optionsData: {},
      optionsSetup: {},
      flagInter: null
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
    // 修改图标options属性
    editorOptions() {
      this.setOptionsData();
    },
    // 数据解析
    setOptionsData() {
      const optionsSetup = this.optionsSetup;
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData, optionsSetup)
        : this.dynamicDataFn(
        optionsData.dynamicData,
        optionsData.refreshTime,
        optionsSetup
        );
    },
    //去重
    setUnique(arr) {
      let newArr = [];
      arr.forEach(item => {
        return newArr.includes(item) ? '' : newArr.push(item);
      });
      return newArr;
    },
    //静态数据
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      //数据
      let xAxisList = [];
      let yAxisList = [];
      let arrayList = [];
      for (const i in val) {
        xAxisList[i] = val[i].axis
        yAxisList[i] = val[i].name
      }
      xAxisList = this.setUnique(xAxisList)
      yAxisList = this.setUnique(yAxisList)
      for (const i in yAxisList) {
        const data = new Array(yAxisList.length).fill(0)
        for (const j in xAxisList) {
          for (const k in val) {
            if (val[k].name == yAxisList[i]) {
              if (val[k].axis == xAxisList[j]) {
                data[j] = val[k].data
              }
            }
          }
        }
        arrayList.push({
          name: yAxisList[i],
          data: data
        })
      }
      this.options.series[0]['name'] = arrayList[0].name
      this.options.series[0]['data'] = arrayList[0].data
      this.options.series[1]['name'] = arrayList[1].name
      this.options.series[1]['data'] = arrayList[1].data
      this.options.yAxis[1]['data'] = xAxisList

      /*if (optionsSetup.verticalShow) {
        this.options.xAxis.data = [];
        this.options.yAxis.data = xAxisList;
        this.options.xAxis.type = "value";
        this.options.yAxis.type = "category";
      } else {
        this.options.xAxis.data = xAxisList;
        this.options.yAxis.data = [];
        this.options.xAxis.type = "category";
        this.options.yAxis.type = "value";
      }*/
    },
    // 动态数据
    dynamicDataFn(val, refreshTime, optionsSetup) {
      if (!val) return;
      if (this.ispreview) {
        this.getEchartData(val, optionsSetup);
        this.flagInter = setInterval(() => {
          this.getEchartData(val, optionsSetup);
        }, refreshTime);
      } else {
        this.getEchartData(val, optionsSetup);
      }
    },
    getEchartData(val, optionsSetup) {
      const data = this.queryEchartsData(val);
      data.then(res => {
        this.renderingFn(optionsSetup, res);
      });
    },
    renderingFn(optionsSetup, val) {
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      // x轴
      if (optionsSetup.verticalShow) {
        this.options.xAxis.data = [];
        this.options.yAxis.data = val.xAxis;
        this.options.xAxis.type = "value";
        this.options.yAxis.type = "category";
      } else {
        this.options.xAxis.data = val.xAxis;
        this.options.yAxis.data = [];
        this.options.xAxis.type = "category";
        this.options.yAxis.type = "value";
      }
      const series = [];
      for (const i in val.series) {
        if (val.series[i].type == "bar") {
          series.push({
            name: val.series[i].name,
            type: "bar",
            data: val.series[i].data,
            barGap: "0%",
            barWidth: optionsSetup.maxWidth,
            label: {
              show: optionsSetup.isShow,
              position: "top",
              distance: 10,
              fontSize: optionsSetup.fontSize,
              color: optionsSetup.subTextColor,
              fontWeight: optionsSetup.fontWeight
            },
            //颜色，圆角属性
            itemStyle: {
              normal: {
                color: arrColor[i],
                barBorderRadius: optionsSetup.radius,
              }
            }
          })
        }
      }
      this.options.series = series
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
