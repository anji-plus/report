<template>
  <div class="calendar-container full-box" :style="styleObj">
    <div class="calendar-header" :style="headerStyle">
      <button class="nav-button" :style="headerBtnStyle" @click="prevMonth" v-if="showButton">&lt;</button>
      <div class="current-month-title">{{ currentMonthTitle }}</div>
      <button class="nav-button" :style="headerBtnStyle" @click="nextMonth" v-if="showButton">&gt;</button>
    </div>
    
    <div class="calendar-month">
      <div class="weekdays" :style="weekStyle">
        <div class="weekday" v-for="day in weekdays" :key="day">{{ day }}</div>
      </div>
      <div class="days-grid" :style="dayStyle">
        <div 
          class="day-cell"
          v-for="day in currentMonthDays"
          :key="day.date"
          :class="{
            'out-of-range': day.isOutOfRange,
            'current-month': day.isCurrentMonth,
            'today': day.isToday
          }"
          :style="cellStyle(day.isToday)"
        >
          <slot name="day" :day="day">
            <div class="day-number">{{ day.day }}</div>
            <div class="day-content" v-html="text[day.date] || ''"></div>
          </slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import { targetWidgetLinkageLogic } from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: 'widgetCalendar',
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      weekdays: ['日', '一', '二', '三', '四', '五', '六'],
      currentMonth: moment().startOf('month'),
      startDate: moment().format('YYYY-MM-DD'),
      endDate: moment().format('YYYY-MM-DD'),
      options: {},
      optionsSetUp: {},
      optionsPosition: {},
      optionsData: {},

      text: ''
    }
  },
  computed: {
    momentStartDate() {
      return moment(this.startDate, 'YYYY-MM-DD').startOf('day')
    },
    momentEndDate() {
      return moment(this.endDate, 'YYYY-MM-DD').endOf('day')
    },
    showButton () {
      return this.optionsSetUp.isButton;
    },
    styleObj() {
      const allStyle = this.optionsPosition;
      return {
        position: this.ispreview ? "absolute" : "static",
        width: allStyle.width + "px",
        height: allStyle.height + "px",
        left: allStyle.left + "px",
        top: allStyle.top + "px",
        background: this.optionsSetUp.tableBgColor,
        borderColor: this.optionsSetUp.borderColor
      };
    },
    headerStyle () {
      return {
        background: this.optionsSetUp.headerBackground,
        color: this.optionsSetUp.headerTextColor,
        justifyContent: this.optionsSetUp.isButton ? 'space-between' : 'center'

      };
    },
    headerBtnStyle () {
      return {
        background: this.optionsSetUp.headerBtnBackground,
        color: this.optionsSetUp.headerBtnTextColor
      };
    },
    weekStyle () {
      return {
        background: this.optionsSetUp.weekBackground,
        color: this.optionsSetUp.weekTextColor
      };
    },
    dayStyle () {
      return {
        backgroundColor: this.optionsSetUp.borderColor
      }
    },
    currentMonthTitle() {
      return `${this.currentMonth.year()}年${this.currentMonth.month() + 1}月`
    },
    currentMonthDays() {
      const daysInMonth = this.currentMonth.daysInMonth()
      const firstDayOfMonth = moment(this.currentMonth).startOf('month')
      const startingDayOfWeek = firstDayOfMonth.day()
      
      const days = []
      
      // 添加上个月的日期
      const daysFromPrevMonth = startingDayOfWeek
      const prevMonth = moment(this.currentMonth).subtract(1, 'month')
      for (let i = 0; i < daysFromPrevMonth; i++) {
        const day = prevMonth.daysInMonth() - daysFromPrevMonth + i + 1
        const date = moment(prevMonth).date(day)
        days.push(this.createDayObject(date, false))
      }
      
      // 添加当前月的日期
      for (let day = 1; day <= daysInMonth; day++) {
        const date = moment(this.currentMonth).date(day)
        days.push(this.createDayObject(date, true))
      }
      
      // 添加下个月的日期
      const totalCells = daysFromPrevMonth + daysInMonth
      const remainingCells = totalCells % 7 === 0 ? 0 : 7 - (totalCells % 7)
      const nextMonth = moment(this.currentMonth).add(1, 'month')
      for (let i = 1; i <= remainingCells; i++) {
        const date = moment(nextMonth).date(i)
        days.push(this.createDayObject(date, false))
      }
      
      return days
    }
  },
  watch: {
    value: {
      handler(val) {
        this.options = val;
        this.optionsSetUp = val.setup;
        this.optionsPosition = val.position;
        this.optionsData = val.data;
        this.setOptionsData();
      },
      deep: true
    }
  },
  mounted() {
    this.options = this.value;
    this.optionsSetUp = this.value.setup;
    this.optionsPosition = this.value.position;
    this.optionsData = this.value.data;
    targetWidgetLinkageLogic(this);
    this.setOptionsData();
  },
  methods: {
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
      } else {
        const data = this.objToOne(this.options).staticData
        let obj = {}
        data.forEach(e => {
          obj[e.date] = e.data
        });
        this.text = obj
      };
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
        let obj = {}
        res.forEach(e => {
          obj[e.date] = e.data
        });
        this.text = obj
        this.$forceUpdate();
      });
    },
    cellStyle (isToday) {
      return {
        backgroundColor: isToday ? this.optionsSetUp.todayBackground : this.optionsSetUp.dayBackground,
        color: isToday ? this.optionsSetUp.todayTextColor : this.optionsSetUp.dayTextColor,
      }
    },
    prevMonth() {
      this.currentMonth = moment(this.currentMonth).subtract(1, 'month')
    },
    nextMonth() {
      this.currentMonth = moment(this.currentMonth).add(1, 'month')
    },
    createDayObject(date, isCurrentMonth) {
      const isToday = date.isSame(moment(), 'day')
      const isBeforeRange = date.isBefore(this.momentStartDate, 'day')
      const isAfterRange = date.isAfter(this.momentEndDate, 'day')
      const isDisabled = isBeforeRange || isAfterRange
      
      return {
        date: date.format('YYYY-MM-DD'),
        year: date.year(),
        month: date.month(), // 0-11
        day: date.date(),   // 1-31
        weekday: date.day(), // 0-6 (0是周日)
        isCurrentMonth,
        isOutOfRange: !isCurrentMonth,
        isToday,
        isBeforeRange,
        isAfterRange,
        isDisabled,
        fullDate: date.toDate()
      }
    }
  }
}
</script>

<style scoped lang="scss">
.calendar-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  border: 1px solid #ddd;
}

.full-box {
  height: 100%;
  .calendar-month {
    height: 100%;
    display: flex;
    flex-direction: column;
    .days-grid {
      flex: 1;
    }
  }
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
  background-color: rgb(10, 115, 255);
  color: #ffffff;
}

.current-month-title {
  font-size: 18px;
  font-weight: bold;
}

.nav-button {
  background: none;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px 10px;
  cursor: pointer;
  font-size: 16px;
  color: #ffffff;
  
  &:hover {
    opacity: .5;
  }
}

.weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  background-color: rgb(10, 39, 50);
  color: #ffffff;
}

.weekday {
  text-align: center;
  padding: 8px 0;
  font-weight: bold;
}

.days-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  grid-gap: 1px;
  background-color: rgb(221, 221, 221);
  flex: 1;
}

.day-cell {
  min-height: 60px;
  background-color: rgb(0, 59, 81);
  padding: 5px;
  position: relative;
  width: calc(100% - 0px);
  display: flex;
  flex-direction: column;
}

/* 当前月份的日期 */
.day-cell.current-month {
  background-color: rgb(0, 59, 81);
  color: #ffffff;
}

/* 非当前月份的日期 */
.day-cell:not(.current-month) {
 background-color: rgba(0, 59, 81, .5);
  color: #ffffff;
}

/* 今天日期 */
.day-cell.today {
  background-color: #e6f7ff;
  color: #000;
}

/* 日期范围外的单元格 */
.day-cell.disabled-day {
  background-color: #e0e0e0;
  color: #999;
  cursor: not-allowed;
}

.day-number {
  font-weight: bold;
  width: 30px;
}
.day-content {
  text-align: left;
  padding: 0 10px;
  flex: 1;
  display: flex;
  flex-direction: row;
  align-items: center;
}
</style>