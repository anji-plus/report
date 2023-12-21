<template>
  <div :style="styleObj">
    <superslide v-if="hackReset" :options="options" class="txtScroll-top">
      <!--表头-->
      <div class="title">
        <div v-for="(item, index) in header" :key="index"
          :style="[headerTableStyle, tableFiledWidth(index), tableRowHeight()]">
          {{ item.name }}
        </div>
      </div>
      <!--数据-->
      <div class="bd">
        <ul class="infoList">
          <li v-for="(item, index) in list" :key="index" :style="tableRowHeight()">
            <div v-for="(itemChild, idx) in header"
              :key="idx"
              :style="[
                bodyTableStyle,
                bodyTable(index),
                tableFiledWidth(idx),
                tableRowHeight()
              ]"
            >
              {{ item[itemChild.key] }}
            </div>
          </li>
        </ul>
      </div>
    </superslide>
  </div>
</template>
<script>
import vue from "vue";
import VueSuperSlide from "vue-superslide";
import { targetWidgetLinkageLogic } from "@/views/bigscreenDesigner/designer/linkageLogic";

vue.use(VueSuperSlide);
export default {
  name: 'widgetTable',
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      hackReset: true,
      options: {
        titCell: ".hd ul",
        mainCell: ".bd ul",
        effect: "topLoop",
        autoPage: true,
        autoPlay: true,
        vis: 5,
        rowHeight: "50px"
      },
      header: [],
      list: [],
      optionsSetUp: {},
      optionsPosition: {},
      optionsData: {},
      flagInter: null,
    };
  },
  computed: {
    styleObj() {
      const allStyle = this.optionsPosition;
      return {
        position: this.ispreview ? "absolute" : "static",
        width: allStyle.width + "px",
        height: allStyle.height + "px",
        left: allStyle.left + "px",
        top: allStyle.top + "px",
        background: this.optionsSetUp.tableBgColor
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
    headerTableStyle() {
      const headStyle = this.optionsSetUp;
      return {
        "text-align": headStyle.textAlignHeader,
        "font-size": headStyle.fontSizeHeader + "px",
        "border-style": headStyle.isLine ? "solid" : "none",
        "border-width": headStyle.borderWidth + "px",
        "border-color": headStyle.borderColor,
        "line-height": headStyle.rowHeight + 'px',
        display: headStyle.isHeader ? "block" : "none",
        color: headStyle.headColor,
        "background-color": headStyle.headBackColor
      };
    },
    bodyTableStyle() {
      const bodyStyle = this.optionsSetUp;
      return {
        "text-align": bodyStyle.textAlignBody,
        "font-size": bodyStyle.fontSizeBody + "px",
        "border-style": bodyStyle.isLine ? "solid" : "none",
        "border-width": bodyStyle.borderWidth + "px",
        "border-color": bodyStyle.borderColor,
        "color": bodyStyle.bodyColor,
        "background-color": bodyStyle.tableBgColor
      };
    }
  },
  watch: {
    value: {
      handler(val) {
        this.optionsSetUp = val.setup;
        this.optionsPosition = val.position;
        this.optionsData = val.data;
        this.initData();
      },
      deep: true
    }
  },
  mounted() {
    this.optionsSetUp = this.value.setup;
    this.optionsPosition = this.value.position;
    this.optionsData = this.value.data;
    this.initData();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    initData() {
      this.handlerRollFn();
      this.handlerHead();
      this.setOptionsData();
      this.visConfig();
    },
    visConfig() {
      this.options.vis = this.optionsSetUp.vis;
    },
    handlerRollFn() {
      const options = this.options;
      const rollSet = this.optionsSetUp;
      options.autoPlay = rollSet.isRoll;
      options.effect = rollSet.effect;
      options.interTime = rollSet.interTime;
      options.delayTime = rollSet.delayTime;
      options.scroll = rollSet.scroll;
      this.options = options;
      this.hackResetFun();
    },
    handlerHead() {
      const head = this.optionsSetUp.dynamicAddTable;
      this.header = head;
    },
    setOptionsData(e, paramsConfig) {
      const tableData = this.optionsData;
      tableData.dynamicData = tableData.dynamicData || {}; // 兼容 dynamicData undefined

      const myDynamicData = tableData.dynamicData;
      clearInterval(this.flagInter); // 不管咋，先干掉上一次的定时任务，避免多跑
      if (
        e &&
        tableData.dataType !== "staticData" &&
        Object.keys(myDynamicData.contextData).length
      ) {
        const keyArr = Object.keys(myDynamicData.contextData);
        paramsConfig.forEach((conf) => {
          if (keyArr.includes(conf.targetKey)) {
            myDynamicData.contextData[conf.targetKey] = e[conf.originKey];
          }
        });
      }

      tableData.dataType == "staticData"
        ? this.handlerStaticData(tableData.staticData)
        : this.handlerDynamicData(tableData.dynamicData, tableData.refreshTime);
    },
    handlerStaticData(data) {
      this.list = data;
    },
    handlerDynamicData(data, refreshTime) {
      if (!data) return;
      if (this.ispreview) {
        this.getEchartData(data);
        this.flagInter = setInterval(() => {
          this.getEchartData(data);
        }, refreshTime);
      } else {
        this.getEchartData(data);
      }
    },
    getEchartData(val) {
      const data = this.queryEchartsData(val);
      data.then(res => {
        this.list = res;
        this.hackResetFun();
      });
    },
    // vue hack 之强制刷新组件
    hackResetFun() {
      this.hackReset = false;
      this.$nextTick(() => {
        this.hackReset = true;
      });
    },
    // 计算 奇偶背景色
    bodyTable(index) {
      let styleJson = {};
      if (index % 2) {
        styleJson["background-color"] = this.optionsSetUp.eventColor;
      } else {
        styleJson["background-color"] = this.optionsSetUp.oldColor;
      }
      return styleJson;
    },
    tableRowHeight() {
      let styleJson = {};
      if (this.optionsSetUp.rowHeight) {
        styleJson["height"] = this.optionsSetUp.rowHeight + "px";
        //styleJson["line-height"] = this.optionsSetUp.rowHeight + "px";
      } else {
        styleJson["height"] = this.options.rowHeight;
        //styleJson["line-height"] = this.optionsSetUp.rowHeight + "px";
      }
      return styleJson;
    },
    tableFiledWidth(index) {
      let styleJson = {};
      if (this.optionsSetUp.dynamicAddTable[index].width) {
        styleJson["width"] = this.optionsSetUp.dynamicAddTable[index].width;
      }
      return styleJson;
    }
  }
};
</script>
<style lang="scss" scoped>
/* 本例子css */
.txtScroll-top {
  overflow: hidden;
  position: relative;
}

.title {
  display: flex;
  flex-direction: row;
  width: 100%;
}

.title > div {
  height: 50px;
  line-height: 50px;
  width: 100%;
}

.txtScroll-top .bd {
  width: 100%;
}

.txtScroll-top .infoList li {
  height: 50px;
  //line-height: 50px;
  display: flex;
  flex-direction: row;
}

.txtScroll-top .infoList li > div {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}

/*.txtScroll-top .infoList li:nth-child(n) {
  background: rgb(0, 59, 81);
}

.txtScroll-top .infoList li:nth-child(2n) {
  background: rgb(10, 39, 50);
}*/
</style>
