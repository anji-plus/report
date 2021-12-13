<!--
:v-model=""
:format="'yyyy-MM-dd HH:mm:ss'"  绑定值的格式,一般是参数传到后台的数据格式
:defaultValue="['00:00:00','23:59:59']"  选中日期后的默认具体时刻 数据格式为数组 ['00:00:00', '23:59:59']
@change=""
-->
<template>
  <div>
    <el-date-picker
      v-model="selectedRangeValue"
      style="width: 100%"
      type="datetimerange"
      range-separator="至"
      start-placeholder="开始日期"
      end-placeholder="结束日期"
      :value-format="format"
      unlink-panels
      :picker-options="pickerOptions"
      :default-time="defaultValue"
      @change="valueChanged"
    />
  </div>
</template>
<script>
import miment from "miment";
export default {
  props: {
    format: {
      type: String,
      default: "yyyy-MM-dd HH:mm:ss"
    },
    defaultValue: {
      type: Array,
      default: () => {
        return [];
      }
    },
    value: {
      type: String,
      default: ""
    }
  },
  data() {
    return {
      selectedRangeValue: [],
      pickerOptions: {
        shortcuts: [
          {
            text: "今天",
            onClick(picker) {
              const end = new Date();
              const start = new Date(
                new Date(new Date().getTime()).setHours(0, 0, 0, 0)
              );
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: "昨天",
            onClick(picker) {
              const start = new Date(
                new Date(new Date().getTime() - 24 * 60 * 60 * 1000).setHours(
                  0,
                  0,
                  0,
                  0
                )
              );
              const end = new Date(
                new Date(new Date().getTime() - 24 * 60 * 60 * 1000).setHours(
                  23,
                  59,
                  59,
                  999
                )
              );
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: "最近一周",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(
                miment()
                  .add(-1, "ww")
                  .stamp()
              );
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: "最近一个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(
                miment()
                  .add(-1, "MM")
                  .stamp()
              );
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: "最近三个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(
                miment()
                  .add(-3, "MM")
                  .stamp()
              );
              picker.$emit("pick", [start, end]);
            }
          }
        ],
        onPick: ({ maxDate, minDate }) => {
          this.minDate = minDate;
          this.maxDate = maxDate;
        }
      }
    };
  },
  watch: {
    value(val) {
      this.parseDefaultVal(val);
    }
  },
  created() {},
  methods: {
    // el-date-range的值默认是数组，gaea需要的是'start,end'字符串，这里做下转换
    parseDefaultVal(val) {
      if (val != null) {
        this.selectedRangeValue = val.split(",");
      } else {
        this.selectedRangeValue = [];
      }
    },
    valueChanged(val) {
      if (val != null) {
        let rangeVal = val.toString();
        this.$emit("change", rangeVal);
        this.$emit("input", rangeVal);
      }
    }
  }
};
</script>
