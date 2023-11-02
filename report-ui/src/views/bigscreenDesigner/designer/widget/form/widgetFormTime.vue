<!--
 * @Author: qianlishi qianlishi@anji-plus.com
 * @Date: 2023-03-06 15:38:10
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-04-20 13:54:57
-->
<template>
  <el-date-picker
    :style="styleObj"
    v-model="timeValue"
    value-format="yyyy-MM-dd HH:mm:ss"
    :picker-options="datetimeRangePickerOptions"
    type="datetimerange"
    @[eventChange]="change"
  />
</template>
<script>
import {
  originWidgetLinkageLogic,
  targetWidgetLinkageLogic,
} from "@/views/bigscreenDesigner/designer/linkageLogic";
import miment from 'miment'

export default {
  name: "WidgetFormTime",
  props: {
    value: Object,
    ispreview: Boolean,
    widgetIndex: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      timeValue: "",
      optionsStyle: {},
      optionsData: {},
      optionsSetup: {},
      //日期时间快捷选项
      datetimeRangePickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            const start = new Date(new Date(new Date().getTime()).setHours(0, 0, 0, 0));
            const end = new Date(new Date(new Date().getTime()).setHours(23, 59, 59, 999));
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const start = new Date(new Date(new Date().getTime() - 24 * 60 * 60 * 1000).setHours(0, 0, 0, 0));
            const end = new Date(new Date(new Date().getTime() - 24 * 60 * 60 * 1000).setHours(23, 59, 59, 999));
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一周',
          onClick(picker) {
            const end = new Date(new Date(new Date().getTime()).setHours(23, 59, 59, 999));
            const start = new Date(new Date(new Date().getTime() + 24 * 60 * 60 * 1000));
            start.setTime(miment().add(-6, 'DD').stamp());
            new Date(start.setHours(0, 0, 0, 0));
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date(new Date(new Date().getTime()).setHours(23, 59, 59, 999));
            const start = new Date();
            start.setTime(miment().add(-1, 'MM').stamp());
            new Date(start.setHours(0, 0, 0, 0));
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date(new Date(new Date().getTime()).setHours(23, 59, 59, 999));
            const start = new Date();
            start.setTime(miment().add(-3, 'MM').stamp());
            new Date(start.setHours(0, 0, 0, 0));
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近半年',
          onClick(picker) {
            const end = new Date(new Date(new Date().getTime()).setHours(23, 59, 59, 999));
            const start = new Date();
            start.setTime(miment().add(-6, 'MM').stamp());
            new Date(start.setHours(0, 0, 0, 0));
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一年',
          onClick(picker) {
            const end = new Date(new Date(new Date().getTime()).setHours(23, 59, 59, 999));
            const start = new Date();
            start.setTime(miment().add(-1, 'YY').stamp());
            new Date(start.setHours(0, 0, 0, 0));
            picker.$emit('pick', [start, end]);
          }
        }],
        // disabledDate(time){
        //   return time.getTime() > Date.now()
        // }
      }
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
        background: this.optionsSetup.select_background,
      };
    },
    eventChange() {
      return "change";
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
  },
  watch: {
    value: {
      handler(val) {
        this.optionsSetup = val.setup;
        this.optionsData = val.data;
        this.optionsStyle = val.position;
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsSetup = this.value.setup;
    this.optionsData = this.value.data;
    this.optionsStyle = this.value.position;

    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    change(event) {
      const formTimeData = {}
      formTimeData['startTime'] = event[0]  //startTime
      formTimeData['endTime'] = event[1] //endTime
      originWidgetLinkageLogic(this, true, {
        currentData: formTimeData,
      }); // 联动-源组件逻辑
    },
  },
};
</script>
<style lang="scss" scoped>
/deep/ .el-select {
  height: 100%;

  .el-input {
    height: 100%;

    .el-input__inner {
      height: 100%;
      background: inherit;
      color: inherit;

      &::placeholder {
        color: inherit;
      }
    }
  }
}
</style>
