<!--
 * @Author: Devli
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2022-3-14 14:04:24
 !-->
 <template>
  <div class="text" :style="computedStyleColor">{{ styleColor.text }}</div>
</template>
<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetText",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {},
      optionsData: {},
      optionsSetup: {},
      flagInter: null,
      // 动态数据当前值，用于条件判断
      currentDataValue: null,
    };
  },
  computed: {
    transStyle() {
      return this.objToOne(this.options);
    },
    styleColor() {
      return {
        position: this.ispreview ? "absolute" : "static",
        color: this.transStyle.color,
        "font-weight": this.transStyle.fontWeight,
        text:  this.transStyle.joinText === "" || this.transStyle.joinText === undefined ? this.transStyle.text : this.transStyle.text + this.transStyle.joinText,
        "font-size": this.transStyle.fontSize + "px",
        "letter-spacing": this.transStyle.letterSpacing + "em",
        background: this.transStyle.background,
        "text-align": this.transStyle.textAlign,
        width: this.transStyle.width + "px",
        height: this.transStyle.height + "px",
        left: this.transStyle.left + "px",
        top: this.transStyle.top + "px",
        right: this.transStyle.right + "px",
        whiteSpace: this.transStyle.whiteSpace ? "pre-line": "normal"
      };
    },
    computedStyleColor() {
      // 合并基础样式和条件样式
      return {
        ...this.styleColor,
        ...this.getConditionalStyle()
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
  },
  watch: {
    value: {
      handler(val) {
        this.options = val;
        this.optionsData = val.data;
        this.optionsSetup = val.setup;
        this.setOptionsData();
      },
      deep: true
    }
  },
  mounted() {
    this.options = this.value;
    this.optionsData = this.value.data;
    this.optionsSetup = this.value.setup;
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
    this.setOptionsData();
  },
  methods: {
    // 根据条件应用样式
    getConditionalStyle() {
      const setup = this.optionsSetup || {};
      
      // 如果未启用条件样式或无当前数据值，返回空对象
      if (!setup.useCondition || this.currentDataValue === null) {
        return {};
      }
      
      // 获取数据值（可能是数字或字符串）
      const value = this.currentDataValue;
      const conditionValue = setup.conditionValue;
      
      // 如果条件值为空，对于包含条件应特殊处理
      if (conditionValue === '' || conditionValue === undefined || conditionValue === null) {
        // 对于包含条件，空条件值不应该匹配任何内容
        if (setup.conditionOperator === 'includes') {
          return {};
        }
      }
      
      // 执行条件判断
      let conditionMet = false;
      
      switch (setup.conditionOperator) {
        case '>':
          conditionMet = Number(value) > Number(conditionValue);
          break;
        case '<':
          conditionMet = Number(value) < Number(conditionValue);
          break;
        case '=':
        case '==':
          conditionMet = value == conditionValue; // 使用非严格相等
          break;
        case '>=':
          conditionMet = Number(value) >= Number(conditionValue);
          break;
        case '<=':
          conditionMet = Number(value) <= Number(conditionValue);
          break;
        case 'includes':
          // 确保非空条件，空字符串不应该匹配任何内容
          conditionMet = conditionValue !== '' && String(value).includes(conditionValue);
          break;
        default:
          conditionMet = false;
      }
      
      // 如果条件满足，应用条件样式
      if (conditionMet) {
        return {
          color: setup.conditionTextColor || undefined,
          background: setup.conditionBgColor || undefined,
          'font-weight': setup.conditionFontWeight || undefined,
          'font-style': setup.conditionFontStyle || undefined,
        };
      }
      
      return {};
    },
    // 数据解析
    setOptionsData(e, paramsConfig) {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      // 联动接收者逻辑开始
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
      // 联动接收者逻辑结束
      if (optionsData.dataType === "dynamicData") {
        this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
      } else {};
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
        // 保存当前数据值用于条件判断
        if (res && res.length > 0) {
          this.currentDataValue = res[0].value;
        }
        
        this.styleColor.text = this.optionsSetup.joinText === undefined || this.optionsSetup.joinText === "" ? res[0].value : res[0].value + this.optionsSetup.joinText;
        this.$forceUpdate();
      });
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
