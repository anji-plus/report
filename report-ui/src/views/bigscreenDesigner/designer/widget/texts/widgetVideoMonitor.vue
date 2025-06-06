<template>
  <div class="video-container" :style="styleObj">
    <div class="video-list" :style="videoListStyle2" v-loading="loading" v-if="isShowList">
      <div class="video-check-list" :style="videoListStyle">
        <ul>
          <li :style="videoListLiStyle" @click="handleCheck(item)" v-for="item in monitorPointList" :key="item.devid" :class="checkVideos.indexOf(item.devid) !== -1 ? 'list-active' : ''">
            <span :style="videoListCheckStyle" class="check-box" :class="checkVideos.indexOf(item.devid) !== -1 ? 'check-active' : ''"></span>
            <span class="check-label">{{ item.monitorName }}</span>
          </li>
        </ul>
        <div class="no-data" v-if="monitorPointList.length === 0">
          <span>暂无数据</span>
        </div>
      </div>
    </div>
    <!-- 监控视频区域 -->
    <div class="video-wrapper">
      <FlvVideo :indexs="JSON.parse(JSON.stringify(checkVideos))" :styleObj="videoWrapperStyle" ref="video"/>
    </div>
  </div>
</template>

<script>
import { targetWidgetLinkageLogic } from "@/views/bigscreenDesigner/designer/linkageLogic";
import FlvVideo from '@/components/FlvVideo';

export default {
  name: 'widgetVideoMonitor',
  components: {
    FlvVideo
  },
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {},
      optionsSetUp: {},
      optionsPosition: {},
      optionsData: {},
      timer: null,
      videoList: [],
      checkVideos: [],
      monitorPointList: [
        // { monitorName: '测试', devid: 0, videoUrl: 'http://example.com/video.flv' },
        // { monitorName: '测试2', devid: 1, videoUrl: 'http://example.com/video.flv' }
      ],
      loading: false,
      autoPlayFirst: false,
      autoPlayTimer: null,
      isShowList: true
    }
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
        backgroundColor: this.optionsSetUp.videoBgColor,
        borderRadius: this.optionsSetUp.borderRadius + 'px'
      };
    },
    videoListStyle () {
      return {
        borderRadius: this.optionsSetUp.borderRadius + 'px',
        backgroundColor: this.optionsSetUp.videoListBgColor,
      };
    },
    videoListStyle2 () {
      return {
        minWidth: this.optionsSetUp.minWidth + 'px',
      };
    },
    videoListLiStyle () {
      return {
        color: this.optionsSetUp.videoListFontColor,
        fontSize: this.optionsSetUp.fontSize + 'px',
      };
    },
    videoListCheckStyle() {
      return {
        borderColor: this.optionsSetUp.videoListFontColor,
      };
    },
    videoWrapperStyle () {
      return {
        borderRadius: this.optionsSetUp.borderRadius + 'px'
      };
    },
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
    setProStyle () {
      this.$nextTick(() => {
        const checks = document.querySelectorAll('.check-box');
        checks.forEach(element => {
          element.style.setProperty('--after-active-color', this.optionsSetUp.videoListFontColor);
        });

        // --hover-list-color
        const lists = document.querySelectorAll('.video-check-list li');
        lists.forEach(element => {
          element.style.setProperty('--hover-list-color', this.optionsSetUp.activeBgColor);
        });
      })
    },
    handleCheck (item) {
      const id = item.devid
      if (this.checkVideos.indexOf(id) === -1) {
        if (this.checkVideos.length === 9) {
          this.$message.warning('最多同时播放9个视频')
          return false
        }
        this.checkVideos.push(id)
      } else {
        this.checkVideos = this.checkVideos.filter(videoId => id !== videoId)
      }

      this.$nextTick(() => {
        const listActives = document.querySelectorAll('.list-active');
        listActives.forEach(element => {
          element.style.setProperty('--hover-list-color', this.optionsSetUp.activeBgColor);
          element.style.setProperty('--hover-list-font-color', this.optionsSetUp.activeFontColor);
        });
      })
      this.initVideo()
    },
    initVideo () {
      const getSplitParams = num => {
        if (num === 0) {
          return '1x1'
        }
        let splitCount = 1
        while (splitCount * splitCount < num) {
          splitCount++
        }
        return `${splitCount}x${splitCount}`
      }
      // 获取视频编号
      const videoDeviceList = this.checkVideos
      let split = getSplitParams(videoDeviceList.length)
      // 5ee093b281a74185aeafec3a463053cd
      this.$refs.video.setLayout(split, 0).then(() => {
        if (videoDeviceList.length === 0) {
          this.$refs.video.stop()
          return false
        }
        // 获取视频编号
        // this.$refs.video.stop()
        if (this.timer) { clearTimeout(this.timer) }
        this.timer = setTimeout(() => {
          // videoDeviceList按devid的顺序排序
          const list_ = videoDeviceList.sort((a, b) => a - b)
          list_.forEach((devid, index) => {
            // item.devid
            const pointList = this.monitorPointList
            const find = pointList.find(item => item.devid === devid)
            if (find) {
              console.info('url:', find.videoUrl)
              this.$refs.video.startPreview(find.videoUrl, devid, 0)
            }
          })
          clearTimeout(this.timer)
        }, 0)
      }) // 分屏 播放模式
    },
    // 数据解析
    setOptionsData(e, paramsConfig) {
      this.autoPlayFirst = this.optionsSetUp.isAutoPlayFirst
      this.isShowList = this.optionsSetUp.isShowList
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
        this.monitorPointList = []
        data.forEach((e, i) => {
          let obj = {
            monitorName: e.name,
            devid: i,
            videoUrl: e.src
          }
          this.monitorPointList.push(obj)
          if (!this.autoPlayFirst) return false
          if (this.autoPlayTimer) { clearTimeout(this.autoPlayTimer) }
          this.autoPlayTimer = setTimeout(() => {
            if (this.monitorPointList.length > 0) {
              this.handleCheck(this.monitorPointList[0])
              this.loading = false
            }
            clearTimeout(this.autoPlayTimer)
          }, 500)
        });
      };

      this.setProStyle()
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
        this.monitorPointList = []
        res.forEach((e, i) => {
          let obj = {
            monitorName: e.name,
            devid: i,
            videoUrl: e.src
          }
          this.monitorPointList.push(obj)
        });
        this.$forceUpdate();
        if (!this.autoPlayFirst) return false
        if (this.autoPlayTimer) { clearTimeout(this.autoPlayTimer) }
        this.autoPlayTimer = setTimeout(() => {
          if (this.monitorPointList.length > 0) {
            this.handleCheck(this.monitorPointList[0])
            this.loading = false
          }
          clearTimeout(this.autoPlayTimer)
        }, 500)
      });
    },
  }
}
</script>

<style scoped lang="scss">
.video-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  padding: 10px;
  border-radius: 10px;
  .video-list {
    flex: .3;
    min-width: 200px;
    height: 100%;
    padding-right: 10px;
    display: flex;
    flex-direction: column;
    .video-check-list {
      flex: 1;
      overflow-y: auto;
      background-color: rgb(0, 59, 81);
      padding: 6px 10px;
      border-radius: 10px;
      ul {
        li {
          display: flex;
          flex-direction: row;
          align-items: center;
          padding: 4px 10px;
          margin-bottom: 4px;
          list-style: none;
          border-radius: 10px;
          cursor: pointer;
          color: #ffffff;
          &:hover {
            // background-color: rgba(10, 39, 50, 1)
            background-color: var(--hover-list-color, rgba(10, 39, 50, 1));
          }
          .check-label {
            // font-size: 16px;
            font-weight: bold;
            margin-left: 10px;
          }
          .check-box {
            display: inline-block;
            width: 14px;
            height: 14px;
            border: 2px solid #ffffff;
            border-radius: 4px;
          }
          .check-active {
            background-color: rgba(10, 39, 50, 1);
            position: relative;
            &::after {
              content: "✓";
              color: var(--after-active-color, #ffffff);
              font-size: 16px;
              position: absolute;
              left: 50%;
              top: 50%;
              transform: translate(-50%, -50%);
            }
          }
        }
        .list-active {
          background-color: var(--hover-list-color, rgba(10, 39, 50, 1));
          color: var(--hover-list-font-color, #ffffff)!important;
        }
      }
    }
  }
  .video-wrapper {
    // box-sizing: border-box;
    // border: 1px solid #ffffff;
    flex: 1;
    font-size: 14px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
  }
  .no-data {
    width: 100%;
    height: 100%;
    font-size: 14px;
    font-weight: bold;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    color: #ffffff;
  }
}


</style>