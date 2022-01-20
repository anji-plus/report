<template>
  <div :style='styleObj'>
    <v-chart :options='options' autoresize/>
  </div>
</template>

<script>

import echarts from 'echarts';

export default {
  name: 'widgetMoreBarLineChart',
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        tooltip: {
          trigger: 'item',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
          left: '2%',
          right: '4%',
          bottom: '14%',
          top: '16%',
          containLabel: true
        },
        legend: {
          data: ['调解成功', '调解失败', '调解终止', '调解成功率'],
          left: '7%',
          top: '5%',
          textStyle: {
            color: '#666666'
          },
          itemWidth: 15,
          itemHeight: 10,
          itemGap: 25
        },
        xAxis: {
          type: 'category',
          data: ['2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'],
          axisLine: {
            lineStyle: {
              color: '#cdd5e2'

            }
          },
          axisLabel: {
            textStyle: {
              color: '#666666'
            }
          },
        },
        yAxis: [
          {
            type: 'value',
            axisLine: {
              show: true,
              lineStyle: {
                color: '#cdd5e2'
              }
            },
            splitLine: {
              show: false,
            },
            axisLabel: {
              textStyle: {
                color: '#666666'
              }
            },
          },
          {
            type: 'value',
            nameTextStyle: {
              color: '#666666'
            },
            position: 'right',
            axisLine: {
              lineStyle: {
                color: '#cdd5e2'
              }
            },
            splitLine: {
              show: false,
            },
            axisLabel: {
              show: true,
              textStyle: {
                color: '#666666'
              }
            }
          }
        ],
        series: [
          {
            name: '调解成功',
            type: 'bar',
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                  offset: 0,
                  color: '#29acff'
                }, {
                  offset: 1,
                  color: '#4bdfff'
                }]),
                barBorderRadius: 6,
              },
            },
            data: []
          },
          {
            name: '调解失败',
            type: 'bar',
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                  offset: 0,
                  color: '#3d93f2'
                }, {
                  offset: 1,
                  color: '#5dc1fd'
                }]),
                barBorderRadius: 6,
              }

            },
            data: []
          },
          {
            name: '调解终止',
            type: 'bar',
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                  offset: 0,
                  color: '#01c871'
                }, {
                  offset: 1,
                  color: '#55f49c'
                }]),
                barBorderRadius: 6,
              }
            },
            data: []
          },
          {
            name: '调解成功率',
            type: 'line',
            yAxisIndex: 1, //使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用
            smooth: false, //平滑曲线显示
            symbol: 'circle', //标记的图形为实心圆
            symbolSize: 8, //标记的大小
            itemStyle: {
              normal: {
                color: '#ffa43a',
                borderColor: 'rgba(255, 234, 0, 0.5)',  //圆点透明 边框
                borderWidth: 5
              },

            },
            lineStyle: {
              color: '#ffa43a'
            },
            data: []
          }
        ]
      }
    }
  },
  computed: {
    styleObj() {
      return {
        position: this.ispreview ? 'absolute' : 'static',
        width: this.optionsStyle.width + 'px',
        height: this.optionsStyle.height + 'px',
        left: this.optionsStyle.left + 'px',
        top: this.optionsStyle.top + 'px',
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
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsX();
      this.setOptionsY();
      this.setOptionsLegend();
      this.setOptionsTooltip();
      this.setOptionsMargin();
      this.setOptionsColor();
      this.setOptionsData();
    },
    // 标题修改
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {};
      title.text = optionsSetup.titleText;
      title.show = optionsSetup.isNoTitle;
      title.left = optionsSetup.textAlign;
      title.textStyle = {
        color: optionsSetup.textColor,
        fontSize: optionsSetup.textFontSize,
        fontWeight: optionsSetup.textFontWeight
      };
      title.subtext = optionsSetup.subText;
      title.subtextStyle = {
        color: optionsSetup.subTextColor,
        fontWeight: optionsSetup.subTextFontWeight,
        fontSize: optionsSetup.subTextFontSize
      };

      this.options.title = title;
    },
    // X轴设置
    setOptionsX() {
      const optionsSetup = this.optionsSetup;
      const xAxis = {
        type: 'category',
        show: optionsSetup.hideX, // 坐标轴是否显示
        name: optionsSetup.xName, // 坐标轴名称
        nameTextStyle: {
          color: optionsSetup.nameColorX,
          fontSize: optionsSetup.nameFontSizeX
        },
        nameRotate: optionsSetup.textAngle, // 文字角度
        inverse: optionsSetup.reversalX, // 轴反转
        axisLabel: {
          show: true,
          interval: optionsSetup.textInterval, // 文字间隔
          rotate: optionsSetup.textAngle, // 文字角度
          textStyle: {
            color: optionsSetup.Xcolor, // x轴 坐标文字颜色
            fontSize: optionsSetup.fontSizeX
          }
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsSetup.lineColorX
          }
        },
        splitLine: {
          show: optionsSetup.isShowSplitLineX,
          lineStyle: {
            color: optionsSetup.splitLineColorX
          }
        }
      };
      this.options.xAxis = xAxis;
    },
    // Y轴设置
    setOptionsY() {
      const optionsSetup = this.optionsSetup;
      const yAxis = [
        {
          type: 'value',
          show: optionsSetup.isShowYLeft, // 坐标轴是否显示
          name: optionsSetup.textNameYLeft, // 坐标轴名称
          nameTextStyle: { // 别名
            color: optionsSetup.nameColorYLeft,
            fontSize: optionsSetup.namefontSizeYLeft
          },
          axisLabel: {
            show: true,
            textStyle: {
              color: optionsSetup.colorY, // y轴 坐标文字颜色
              fontSize: optionsSetup.fontSizeY
            }
          },
          axisLine: {
            show: optionsSetup.isShowYLeft,
            lineStyle: {
              color: optionsSetup.lineColorY
            }
          },
          splitLine: {
            show: false,
          }
        },
        {
          type: 'value',
          position: 'right',
          show: optionsSetup.isShowYRight, // 坐标轴是否显示
          name: optionsSetup.textNameYRight, // 坐标轴名称
          nameTextStyle: { // 别名
            color: optionsSetup.nameColorYRight,
            fontSize: optionsSetup.namefontSizeYRight
          },
          axisLabel: {
            show: true,
            textStyle: {
              color: optionsSetup.colorY, // y轴 坐标文字颜色
              fontSize: optionsSetup.fontSizeY
            }
          },
          axisLine: {
            show: optionsSetup.isShowYRight,
            lineStyle: {
              color: optionsSetup.lineColorY
            }
          },
          splitLine: {
            show: false,
          }
        }
      ];
      this.options.yAxis = yAxis;
    },
    // tooltip 设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: 'item',
        show: true,
        textStyle: {
          color: optionsSetup.lineColor,
          fontSize: optionsSetup.tipFontSize
        }
      };
      this.options.tooltip = tooltip;
    },
    // 边距设置
    setOptionsMargin() {
      const optionsSetup = this.optionsSetup;
      const grid = {
        left: optionsSetup.marginLeft,
        right: optionsSetup.marginRight,
        bottom: optionsSetup.marginBottom,
        top: optionsSetup.marginTop,
        containLabel: true
      };
      this.options.grid = grid;
    },
    setOptionsLegend() {
      const optionsSetup = this.optionsSetup;
      const legend = this.options.legend;
      legend.show = optionsSetup.isShowLegend;
      legend.left = optionsSetup.lateralPosition;
      legend.top = optionsSetup.longitudinalPosition;
      legend.bottom =
        optionsSetup.longitudinalPosition;
      legend.orient = optionsSetup.layoutFront;
      legend.textStyle = {
        color: optionsSetup.lengedColor,
        fontSize: optionsSetup.lengedFontSize
      };
      legend.itemWidth = optionsSetup.lengedWidth;
    },
    // 图例名称设置
    setOptionsLegendName(name){
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      const legendName = optionsSetup.legendName;
      // 图例没有手动写则显示原值，写了则显示新值
      if (null == legendName || legendName == '') {
        for (let i = 0; i < name.length; i++) {
          series[i].name = name[i];
        }
        this.options.legend['data'] = name;
      }else {
        const arr = legendName.split('|');
        for (let i = 0; i < arr.length; i++) {
          series[i].name = arr[i];
        }
        this.options.legend['data'] = arr
      }
    },
    // 颜色修改
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const customColor = optionsSetup.customColor;
      const series = this.options.series;
      if (!customColor) return;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      for (const i in series) {
        if (series[i].type == 'bar') {
          series[i].itemStyle.normal['color'] = arrColor[i];
        } else {
          series[i].lineStyle['color'] = arrColor[i];
        }
      }
    },
    // 数据处理
    setOptionsData() {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == 'staticData'
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      let axis = [];
      let bar1 = [];
      let bar2 = [];
      let bar3 = [];
      let line = [];
      for (const i in val) {
        axis[i] = val[i].date;
        bar1[i] = val[i].unsales;
        bar2[i] = val[i].manus;
        bar3[i] = val[i].rework;
        line[i] = val[i].sales;
      }
      // x轴
      this.options.xAxis.data = axis;
      // series
      for (const i in series) {
        if (series[i].type == 'bar') {
          series[i].label = {
            show: optionsSetup.isShowBar,
            position: 'top',
            distance: optionsSetup.distanceBar,
            fontSize: optionsSetup.fontSizeBar,
            color: optionsSetup.subTextColorBar,
            fontWeight: optionsSetup.fontWeightBar
          };
          series[i].barWidth = optionsSetup.maxWidth;
          series[i].itemStyle.normal['barBorderRadius'] = optionsSetup.radius;
        } else if (series[i].type == 'line') {
          series[i].yAxisIndex = 1;
          series[i].showSymbol = optionsSetup.markPoint;
          series[i].symbolSize = optionsSetup.pointSize;
          series[i].smooth = optionsSetup.smoothCurve;
          if (optionsSetup.area) {
            series[i].areaStyle = {
              opacity: optionsSetup.areaThickness / 100
            };
          } else {
            series[i].areaStyle = {
              opacity: 0
            };
          }
          series[i].lineStyle = {
            width: optionsSetup.lineWidth
          };
          series[i].label = {
            show: optionsSetup.isShowLine,
            position: 'top',
            distance: optionsSetup.distanceLine,
            fontSize: optionsSetup.fontSizeLine,
            color: optionsSetup.subTextColorLine,
            fontWeight: optionsSetup.fontWeightLine
          };
        }
      }
      series[0].data = bar1;
      series[1].data = bar2;
      series[2].data = bar3;
      series[3].data = line;
      const legendName = [];
      legendName.push('调解成功');
      legendName.push('调解失败');
      legendName.push('调解终止');
      legendName.push('调解成功率');
      this.options.legend['data'] = legendName;
      this.setOptionsLegendName(legendName);
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
      const optionsSetup = this.optionsSetup;
      this.options.xAxis.data = val.xAxis;
      const series = [];
      const legendName = [];
      for (const i in val.series) {
        const obj = {};
        if (val.series[i].type == 'bar') {
          obj.name = val.series[i].name;
          obj.type = val.series[i].type;
          obj.label = {
            show: optionsSetup.isShowBar,
            position: 'top',
            distance: optionsSetup.distanceBar,
            fontSize: optionsSetup.fontSizeBar,
            color: optionsSetup.subTextColorBar,
            fontWeight: optionsSetup.fontWeightBar
          };
          obj.barWidth = optionsSetup.maxWidth;
          obj.itemStyle = {
            normal: {
              barBorderRadius: optionsSetup.radius,
            }
          };
          obj.data = val.series[i].data;
          series.push(obj);
        } else if (val.series[i].type == 'line') {
          obj.name = val.series[i].name;
          obj.type = val.series[i].type;
          obj.yAxisIndex = 1;
          obj.showSymbol = optionsSetup.markPoint;
          obj.symbolSize = optionsSetup.pointSize;
          obj.smooth = optionsSetup.smoothCurve;
          if (optionsSetup.area) {
            obj.areaStyle = {
              opacity: optionsSetup.areaThickness / 100
            };
          } else {
            obj.areaStyle = {
              opacity: 0
            };
          }
          obj.lineStyle = {
            width: optionsSetup.lineWidth
          };
          obj.label = {
            show: optionsSetup.isShowLine,
            position: 'top',
            distance: optionsSetup.distanceLine,
            fontSize: optionsSetup.fontSizeLine,
            color: optionsSetup.subTextColorLine,
            fontWeight: optionsSetup.fontWeightLine
          };
          obj.data = val.series[i].data;
          series.push(obj);
        }
        legendName.push(val.series[i].name);
      }
      this.options.series = series;
      this.options.legend['data'] = legendName;
      this.setOptionsLegendName(legendName);
    },
  }
};

</script>

<style scoped lang='scss'>
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
