<template>
  <div class="video-container" :class="`layout-${currentLayout}`" :style="styleObj">
    <div 
      v-for="(player, index) in sortedPlayers" 
      :key="player.videoId" 
      class="video-item"
      :style="getItemStyle(index)"
    >
      <video 
        :ref="`video-${player.videoId}`" 
        class="video-element" 
        :class="`video-${player.videoId}`"
        controls
        autoplay
        muted
      ></video>
      <!-- <span class="video-title">通道_{{ (player.videoId + 1) }}</span> -->
      <div v-if="player.src === ''" class="video-placeholder">
        <svg t="1745889737159" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4930" width="48" height="48"><path d="M504.832 644.608c-47.616 0-86.016 38.4-86.016 86.016s38.4 86.016 86.016 86.016 86.016-38.4 86.016-86.016-38.4-86.016-86.016-86.016z m422.4 250.88h-153.088c118.784-84.48 196.096-222.72 196.096-379.392 0-257.024-208.384-465.408-465.408-465.408S39.424 258.56 39.424 515.584s208.384 465.408 465.408 465.408h422.4c23.552 0 43.008-19.456 43.008-43.008s-19.456-42.496-43.008-42.496z m-422.4 0c-209.408 0-379.392-169.984-379.392-379.392s169.984-379.392 379.392-379.392 379.392 169.984 379.392 379.392c0 209.408-169.984 379.392-379.392 379.392zM289.792 430.08c-47.616 0-86.016 38.4-86.016 86.016s38.4 86.016 86.016 86.016 86.016-38.4 86.016-86.016S337.408 430.08 289.792 430.08z m250.88 92.672c0-19.968-15.872-35.84-35.84-35.84s-35.84 15.872-35.84 35.84 15.872 35.84 35.84 35.84 35.84-15.872 35.84-35.84zM712.704 430.08c-47.616 0-86.016 38.4-86.016 86.016s38.4 86.016 86.016 86.016 86.016-38.4 86.016-86.016S759.808 430.08 712.704 430.08zM504.832 215.04c-47.616 0-86.016 38.4-86.016 86.016s38.4 86.016 86.016 86.016 86.016-38.4 86.016-86.016S552.448 215.04 504.832 215.04z" fill="#ffffff" p-id="4931"></path></svg>
      </div>
    </div>
  </div>
</template>

<script>
import flvjs from 'flv.js'
import { set } from 'vue'

export default {
  name: 'FlvVideo',
  props: {
    maxPlayers: {
      type: Number,
      default: 9 // 3x3最大数量
    },
    indexs: {
      type: Array,
      default: () => [],
    },
    styleObj: {
      type: Object,
      default: () => ({}),
    },
  },
  data() {
    return {
      timer: null,
      currentLayout: '1x1',
      players: {}, // 改为对象存储，key为videoId
      flvjs: null
    }
  },
  computed: {
    // 根据indexs排序后的播放器数组
    sortedPlayers() {
      const maxCount = this.getMaxPlayerCount()
      const result = []
      
      // 1. 先添加indexs中存在的播放器
      this.indexs.slice(0, maxCount).forEach(videoId => {
        if (this.players[videoId]) {
          result.push(this.players[videoId])
        } else {
          // 如果不存在则创建新播放器占位
          result.push({
            videoId,
            active: false,
            flvPlayer: null,
            src: ''
          })
        }
      })
      
      // 2. 如果还有空位，添加已存在但不在indexs中的播放器（保留状态）
      // const remainingSlots = maxCount - result.length
      // if (remainingSlots > 0) {
      //   const existingPlayers = Object.values(this.players)
      //     .filter(player => !this.indexs.includes(player.videoId))
      //     .slice(0, remainingSlots)
      //   result.push(...existingPlayers)
      // }
      // 2. 清理不在indexs中的播放器
      Object.keys(this.players).forEach(videoId => {
        if (!this.indexs.includes(Number(videoId))) {
          this.stopPlayer(videoId)
        }
      })
      
      // 3. 如果还有空位，添加空白占位
      while (result.length < maxCount) {
        result.push({
          videoId: `placeholder-${result.length}`,
          active: false,
          flvPlayer: null,
          src: ''
        })
      }

      console.log('this.players:', result)
      
      return result
    }
  },
  watch: {
    indexs: {
      immediate: true,
      deep: true,
      handler(newIds, oldIds = []) {
        this.syncPlayers(newIds, oldIds)
      }
    }
  },
  mounted() {
    this.flvjs = flvjs
    if (!this.flvjs.isSupported()) {
      console.error('FLV is not supported in this browser')
    }
  },
  beforeDestroy() {
    this.stopAll()
  },
  methods: {
    // 同步播放器状态
    syncPlayers(newIds, oldIds) {
      if (this.timer) { clearTimeout(this.timer) }
      this.timer = setTimeout(() => {
        const maxCount = this.getMaxPlayerCount()
        const idsToKeep = newIds.slice(0, maxCount)
        
        // 停止不再需要的播放器
        oldIds.forEach(videoId => {
          if (!idsToKeep.includes(videoId)) {
            this.stopPlayer(videoId)
          }
        })
        
        // 更新布局
        this.updateLayout()

        clearTimeout(this.timer)
      }, 0)
    },
    
    // 更新布局
    updateLayout() {
      const count = Math.min(this.indexs.length, this.getMaxPlayerCount())
      let layout = '1x1'
      if (count > 4) {
        layout = '3x3'
      } else if (count > 1) {
        layout = '2x2'
      }
      this.currentLayout = layout
    },
    
    // 设置分屏布局
    setLayout(layout) {
      return new Promise((resolve) => {
        const validLayouts = ['1x1', '2x2', '3x3']
        if (!validLayouts.includes(layout)) {
          console.error(`Invalid layout: ${layout}. Supported layouts are ${validLayouts.join(', ')}`)
          return
        }
        this.currentLayout = layout
        this.$nextTick(resolve)
      })
    },
    
    // 开始预览指定视频
    startPreview(src, videoId) {
      if (!src) {
        console.error('No video source provided')
        return
      }
      
      // 如果已经存在相同的播放器且src相同，则不处理
      if (this.players[videoId] && this.players[videoId].src === src && this.players[videoId].active) {
        return
      }
      
      // 停止当前播放器（如果存在）
      if (this.players[videoId]) {
        this.stopPlayer(videoId)
      }
      
      this.createPlayer(src, videoId)
    },

    getFileExtension(url) {
      // 匹配最后一个点后的字母数字组合（忽略查询参数和哈希）
      const match = /\.([a-z0-9]+)(?:[?#]|$)/i.exec(url.split('/').pop());
      return match ? match[1].toLowerCase() : '';
    },
    
    // 创建FLV播放器
    createPlayer(src, videoId) {
      this.$nextTick(() => {
        const videoElement = this.$refs[`video-${videoId}`][0] || null
        if (!videoElement) {
          // console.error(`Video element not found for videoId: ${videoId}`)
          return
        }
        
        if (this.flvjs.isSupported()) {
          const flvPlayer = this.flvjs.createPlayer({
            type: this.getFileExtension(src),
            url: src,
            isLive: true
          })
          
          flvPlayer.attachMediaElement(videoElement)
          flvPlayer.load()
          
          // 初始化播放器状态
          this.$set(this.players, videoId, {
            active: false,
            flvPlayer,
            src,
            videoId
          })
          
          // 添加事件监听
          flvPlayer.on(flvjs.Events.METADATA_ARRIVED, () => {
            this.$set(this.players[videoId], 'active', true)
          })
          
          flvPlayer.on(flvjs.Events.ERROR, (err) => {
            console.error('FLV player error:', err)
            this.stopPlayer(videoId)
            this.$message.error('Playback error:' + err)
          })
          
          try {
            flvPlayer.play()
          } catch (err) {
            console.error('Playback error:', err)
            this.stopPlayer(videoId)
            this.$message.error('Playback error:' + err)
          }
        }
      })
      // console.log('this.players:', this.players)
    },
    
    // 停止所有视频播放
    stop() {
      this.stopAll()
    },
    
    // 停止指定播放器
    stopPlayer(videoId) {
      const player = this.players[videoId]
      if (player && player.flvPlayer) {
        player.flvPlayer.pause()
        player.flvPlayer.unload()
        player.flvPlayer.detachMediaElement()
        player.flvPlayer.destroy()
        this.$set(this.players[videoId], 'active', false)
        this.$set(this.players[videoId], 'flvPlayer', null)
        this.$set(this.players[videoId], 'src', '')
        // this.players = this.players.filter(item => item.videoId !== videoId)

        // console.log('this.players:', this.players)
      }
    },
    
    // 停止所有播放器
    stopAll() {
      Object.keys(this.players).forEach(videoId => {
        this.stopPlayer(videoId)
      })
    },
    
    // 获取当前布局下的最大播放器数量
    getMaxPlayerCount() {
      const [rows, cols] = this.currentLayout.split('x').map(Number)
      return rows * cols
    },
    
    // 获取视频项的样式
    getItemStyle(index) {
      const [rows, cols] = this.currentLayout.split('x').map(Number)
      const maxIndex = rows * cols - 1
      
      if (index > maxIndex) {
        return { display: 'none' }
      }
      
      return {
        width: `${100 / cols}%`,
        height: `${100 / rows}%`
      }
    }
  }
}
</script>

<style scoped>
.video-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-wrap: wrap;
  background-color: #000;
  position: relative;
}

.video-item {
  position: relative;
  box-sizing: border-box;
  border: 1px solid #333;
}

.video-element {
  width: 100%;
  height: 100%;
  object-fit: cover;
  /* background-color: #000; */
}
.video-title {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 14px;
  color: red;
  font-weight: bold;
}

.video-placeholder {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  background-color: #222;
  font-size: 14px;
}

/* 不同布局下的样式 */
.layout-1x1 .video-item {
  width: 100% !important;
  height: 100% !important;
}

.layout-2x2 .video-item {
  width: 50% !important;
  height: 50% !important;
}

.layout-3x3 .video-item {
  width: 33.33% !important;
  height: 33.33% !important;
}
</style>