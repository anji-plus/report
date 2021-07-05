<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <div class="text" :style="styleObj">
    <v-chart :options="options" autoresize />
  </div>
</template>

<script>
export default {
  name: "WidgetText",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        legend: {
          textStyle: {
            color: "#fff"
          }
        },
        series: [
          {
            type: "text",
            data: [],
            emphasis: {
              itemStyle: {
                borderRadius: null
              }
            }
          }
        ],
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
      optionsSetup: {},
      flagInter: null
    };
  },
  computed: {
    /*    transStyle() {
          return this.objToOne(this.options);
        },
        styleColor() {
          return {
            position: this.ispreview ? "absolute" : "static",
            color: this.transStyle.color,
            "font-weight": this.transStyle.fontWeight,
            text: this.transStyle.text,
            "font-size": this.transStyle.fontSize + "px",
            "letter-spacing": this.transStyle.letterSpacing + "em",
            background: this.transStyle.background,
            "text-align": this.transStyle.textAlign,
            width: this.transStyle.width + "px",
            height: this.transStyle.height + "px",
            left: this.transStyle.left + "px",
            top: this.transStyle.top + "px",
            right: this.transStyle.right + "px"
          };
        },*/
    styleObj() {
      return {
        position: this.ispreview ? "absolute" : "static",
        width: this.optionsStyle.width + "px",
        height: this.optionsStyle.height + "px",
        left: this.optionsStyle.left + "px",
        top: this.optionsStyle.top + "px",
        background: this.optionsSetup.background
      };
    },
  },
  /*  watch: {
      value: {
        handler(val) {
          this.options = val;
        },
        deep: true
      }
    },*/
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
  /*  mounted() {
      this.options = this.value;
    },*/
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
      this.setOptionsTitle();
      this.setOptionsX();
      this.setOptionsY();
      this.setOptionsTop();
      this.setOptionsTooltip();
      this.setOptionsMargin();
      this.setOptionsLegend();
      this.setOptionsColor();
      this.setOptionsData();
    },
    //静态数据
    staticDataFn(val) {
      const staticData = JSON.parse(val);
      for (const key in this.options.series) {
        if (this.options.series[key].type == "text") {
          this.options.series[key].data = staticData;
        }
      }
    },
    // 动态数据
    dynamicDataFn(val, refreshTime) {
      console.log()
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
        if (this.options.series[key].type == "text") {
          this.options.series[key].data = val;
        }
      }
    }
  }
};
</script>

<style scoped lang="scss">
.text {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
