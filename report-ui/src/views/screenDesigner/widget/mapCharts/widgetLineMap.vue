<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>
<script>
import "echarts/map/js/china.js";
import echarts from "echarts";
import {conversionCity} from '@/utils/china';
/*let geoCoordMap = {
  上海市: [121.4648, 31.2891],
  东莞市: [113.8953, 22.901],
  东营市: [118.7073, 37.5513],
  中山市: [113.4229, 22.478],
  临汾市: [111.4783, 36.1615],
  临沂市: [118.3118, 35.2936],
  丹东市: [124.541, 40.4242],
  丽水市: [119.5642, 28.1854],
  乌鲁木齐市: [87.9236, 43.5883],
  佛山市: [112.8955, 23.1097],
  保定市: [115.0488, 39.0948],
  兰州市: [103.5901, 36.3043],
  包头市: [110.3467, 41.4899],
  北京市: [116.4551, 40.2539],
  北海市: [109.314, 21.6211],
  南京市: [118.8062, 31.9208],
  南宁市: [108.479, 23.1152],
  南昌市: [116.0046, 28.6633],
  南通市: [121.1023, 32.1625],
  厦门市: [118.1689, 24.6478],
  台州市: [121.1353, 28.6688],
  合肥市: [117.29, 32.0581],
  呼和浩特市: [111.4124, 40.4901],
  咸阳市: [108.4131, 34.8706],
  哈尔滨市: [127.9688, 45.368],
  唐山市: [118.4766, 39.6826],
  嘉兴市: [120.9155, 30.6354],
  大同市: [113.7854, 39.8035],
  大连市: [122.2229, 39.4409],
  天津市: [117.4219, 39.4189],
  太原市: [112.3352, 37.9413],
  威海市: [121.9482, 37.1393],
  宁波市: [121.5967, 29.6466],
  宝鸡市: [107.1826, 34.3433],
  宿迁市: [118.5535, 33.7775],
  常州市: [119.4543, 31.5582],
  广州市: [113.5107, 23.2196],
  廊坊市: [116.521, 39.0509],
  延安市: [109.1052, 36.4252],
  张家口市: [115.1477, 40.8527],
  徐州市: [117.5208, 34.3268],
  德州市: [116.6858, 37.2107],
  惠州市: [114.6204, 23.1647],
  成都市: [103.9526, 30.7617],
  扬州市: [119.4653, 32.8162],
  承德市: [117.5757, 41.4075],
  拉萨市: [91.1865, 30.1465],
  无锡市: [120.3442, 31.5527],
  日照市: [119.2786, 35.5023],
  昆明市: [102.9199, 25.4663],
  杭州市: [119.5313, 29.8773],
  枣庄市: [117.323, 34.8926],
  柳州市: [109.3799, 24.9774],
  株洲市: [113.5327, 27.0319],
  武汉市: [114.3896, 30.6628],
  汕头市: [117.1692, 23.3405],
  江门市: [112.6318, 22.1484],
  沈阳市: [123.1238, 42.1216],
  沧州市: [116.8286, 38.2104],
  河源市: [114.917, 23.9722],
  泉州市: [118.3228, 25.1147],
  泰安市: [117.0264, 36.0516],
  泰州市: [120.0586, 32.5525],
  济南市: [117.1582, 36.8701],
  济宁市: [116.8286, 35.3375],
  海口市: [110.3893, 19.8516],
  淄博市: [118.0371, 36.6064],
  淮安市: [118.927, 33.4039],
  深圳市: [114.5435, 22.5439],
  清远市: [112.9175, 24.3292],
  温州市: [120.498, 27.8119],
  渭南市: [109.7864, 35.0299],
  湖州市: [119.8608, 30.7782],
  湘潭市: [112.5439, 27.7075],
  滨州市: [117.8174, 37.4963],
  潍坊市: [119.0918, 36.524],
  烟台市: [120.7397, 37.5128],
  玉溪市: [101.9312, 23.8898],
  珠海市: [113.7305, 22.1155],
  盐城市: [120.2234, 33.5577],
  盘锦市: [121.9482, 41.0449],
  石家庄市: [114.4995, 38.1006],
  福州市: [119.4543, 25.9222],
  秦皇岛市: [119.2126, 40.0232],
  绍兴市: [120.564, 29.7565],
  聊城市: [115.9167, 36.4032],
  肇庆市: [112.1265, 23.5822],
  舟山市: [122.2559, 30.2234],
  苏州市: [120.6519, 31.3989],
  莱芜市: [117.6526, 36.2714],
  菏泽市: [115.6201, 35.2057],
  营口市: [122.4316, 40.4297],
  葫芦岛市: [120.1575, 40.578],
  衡水市: [115.8838, 37.7161],
  衢州市: [118.6853, 28.8666],
  西宁市: [101.4038, 36.8207],
  西安市: [109.1162, 34.2004],
  贵阳市: [106.6992, 26.7682],
  连云港市: [119.1248, 34.552],
  邢台市: [114.8071, 37.2821],
  邯郸市: [114.4775, 36.535],
  郑州市: [113.4668, 34.6234],
  鄂尔多斯市: [108.9734, 39.2487],
  重庆市: [107.7539, 30.1904],
  金华市: [120.0037, 29.1028],
  铜川市: [109.0393, 35.1947],
  银川市: [106.3586, 38.1775],
  镇江市: [119.4763, 31.9702],
  长春市: [125.8154, 44.2584],
  长沙市: [113.0823, 28.2568],
  长治市: [112.8625, 36.4746],
  阳泉市: [113.4778, 38.0951],
  青岛市: [120.4651, 36.3373],
  韶关市: [113.7964, 24.7028]
};*/
let geoCoordMap = conversionCity;
let planePath =
  "path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z";
export default {
  name: "widgetLineMap",
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        title: {
          left: "center",
          textStyle: {
            color: "#fff"
          }
        },
        tooltip: {
          trigger: 'item',
          formatter: function (params, ticket, callback) {
            if (params.seriesType == "effectScatter") {
              return "线路：" + params.data.name + "" + params.data.value[2];
            } else if (params.seriesType == "lines") {
              return params.data.fromName + ">" + params.data.toName + "<br />" + params.data.value;
            } else {
              return params.name;
            }
          }
        },
        legend: {
          show: true,
          orient: 'vertical',
          top: 'bottom',
          left: 'right',
          textStyle: {
            color: '#fff'
          },
          selectedMode: 'multiple',
        },
        geo: {
          map: "china",
          label: {
            emphasis: {
              show: true,
              color: "white"
            }
          },
          roam: true,
          itemStyle: {
            normal: {
              areaColor: "#323c48",
              borderColor: "#404a59",
              borderWidth: 1,
            },
            emphasis: {
              areaColor: "#2a333d"
            }
          },
        },
        series: [
          {
            //name: tempData[0],
            type: "lines",
            zlevel: 1,
            effect: {
              show: false,
              period: 6,
              trailLength: 0.7,
              color: "#fff",
              symbolSize: 3
            },
            lineStyle: {
              normal: {
                color: '#a6c84c',
                width: 0,
                curveness: 0.2
              }
            },
            data: [],
          },
          {
            type: "lines",
            zlevel: 2,
            symbol: ['none', 'arrow'],
            symbolSize: 10,
            effect: {
              show: true,
              period: 4,
              trailLength: 0,
              symbol: 'arrow',
              symbolSize: 5
            },
            lineStyle: {
              normal: {
                // 颜色+ 线条
                color: '#ffa022',
                width: 1,
                opacity: 0.4,
                curveness: 0.2
              }
            },
            data: [],
          },
          {
            // 起点
            //name: tempData[0],
            type: 'effectScatter',
            coordinateSystem: 'geo',
            zlevel: 2,
            rippleEffect: {
              brushType: 'stroke'
            },
            label: {
              normal: {
                show: true,
                position: 'right',
                formatter: '{b}',
                fontSize: 22,
              }
            },
            // 点的大小
            symbolSize: 10,
            itemStyle: {
              normal: {
                // 地图点颜色
                color: '#46bee9'
              }
            },
            data: [],
          },
          {
            // 终点
            //name: tempData[0],
            type: 'effectScatter',
            coordinateSystem: 'geo',
            zlevel: 2,
            rippleEffect: {
              brushType: 'stroke'
            },
            label: {
              normal: {
                show: true,
                position: 'right',
                formatter: '{b}',
                fontSize: 22,
              }
            },
            // 点的大小
            symbolSize: 10,
            itemStyle: {
              normal: {
                // 地图点颜色
                color: '#46bee9'
              }
            },
            data: [],
          },
        ]
      },
      optionsSetup: {}
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
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true
    }
  },
  created() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsSetup = this.value.setup;
  },
  mounted() {
    this.editorOptions();
  },
  methods: {
    convertData(data) {
      let res = [];
      for (let i = 0; i < data.length; i++) {
        let dataItem = data[i];
        let sourceCoord = geoCoordMap[dataItem.source];
        let targetCoord = geoCoordMap[dataItem.target];
        if (sourceCoord && targetCoord) {
          res.push({
              fromName: dataItem.source,
              toName: dataItem.target,
              coords: [sourceCoord, targetCoord],
              value: dataItem.value,
            }
          )
        }
        ;
      }
      return res;
    },
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsSource();
      this.setOptionsTarget();
      this.setOptionsSymbol();
      this.setOptionsLine();
      this.setOptionsColor();
      this.setOptionsData();
    },
    // 标题设置
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {};
      title.show = optionsSetup.isNoTitle;
      title.text = optionsSetup.titleText;
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
    // 起点设置
    setOptionsSource(){
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[2];
      const normal = {
        show: optionsSetup.isShowSource,
        position: 'right',
        color: optionsSetup.sourceFontTextColor,
        fontSize: optionsSetup.sourceFontTextSize,
        fontWeight: optionsSetup.sourceFontTextWeight,
      };
      const itemStyle = {
        normal: {
          color: optionsSetup.sourcePointColor,
        }
      };
      series.symbolSize = optionsSetup.sourceSymbolSize;
      series.label.normal = normal;
      series.itemStyle = itemStyle;
    },
    // 终点设置
    setOptionsTarget(){
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[3];
      const normal = {
        show: optionsSetup.isShowTarget,
        position: 'right',
        color: optionsSetup.targetFontTextColor,
        fontSize: optionsSetup.targetFontTextSize,
        fontWeight: optionsSetup.targetFontTextWeight,
      };
      const itemStyle = {
        normal: {
          color: optionsSetup.targetPointColor,
        }
      };
      series.symbolSize = optionsSetup.targetSymbolSize;
      series.label.normal = normal;
      series.itemStyle = itemStyle;
    },
    // 图标设置
    setOptionsSymbol(){
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[1];
      const effect = {
        show: true,
        period: this.setPeriod(optionsSetup),
        trailLength: 0,
        symbol: this.setSymbol(optionsSetup),
        symbolSize: optionsSetup.symbolSize,
        color: optionsSetup.symbolColor,
      };
      series['effect'] = effect;
    },
    setSymbol(optionsSetup) {
      let symbol;
      if (optionsSetup.symbol == 'plane') {
        symbol = planePath;
      } else {
        symbol = "arrow";
      }
      return symbol;
    },
    setPeriod(optionsSetup){
      let period;
      if (optionsSetup.symbol == 'plane') {
        period = optionsSetup.symbolPeriod - 1;
      }else {
        period = optionsSetup.symbolPeriod;
      }
      return period;
    },
    // 线设置
    setOptionsLine() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series[1];
      const lineStyle = {
        normal: {
          // 线条颜色
          color: optionsSetup.lineColor,
          width: optionsSetup.lineWidth,
          opacity: 0.4,
          curveness: 0.2
        }
      };
      series['lineStyle'] = lineStyle;
    },
    // 地图颜色设置
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const itemStyle = {
        normal: {
          // 地图的颜色
          areaColor: optionsSetup.blockColor,
          borderColor: optionsSetup.borderColor,
        },
        emphasis: {
          // 地图块颜色
          areaColor: optionsSetup.highlightColor,
        }
      };
      this.options.geo["itemStyle"] = itemStyle;
    },
    //数据解析
    setOptionsData() {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const series = this.options.series;
      series[0]["data"] = this.convertData(val);
      series[1]["data"] = this.convertData(val);
      series[2]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.source,
            value: geoCoordMap[dataItem.source].concat([dataItem.value])
          }
        }
      });
      series[3]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.target,
            value: geoCoordMap[dataItem.target].concat([dataItem.value])
          }
        }
      });
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
      const series = this.options.series;
      series[0]["data"] = this.convertData(val);
      series[1]["data"] = this.convertData(val);
      series[2]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.source,
            value: geoCoordMap[dataItem.source].concat([dataItem.value])
          }
        }
      });
      series[3]["data"] = val.map(function (dataItem) {
        if (geoCoordMap[dataItem.source] && geoCoordMap[dataItem.target]) {
          return {
            name: dataItem.target,
            value: geoCoordMap[dataItem.target].concat([dataItem.value])
          }
        }
      });
    }
  }
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
