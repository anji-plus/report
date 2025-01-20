<template>
  <div class="layContent wrapper whitewrapper" id="layContent">
    <sketch-rule 
      :scale="scale"
      :rate="rate"
      :thick="thick" 
      :canvasWidth="canvasWidth"
      :canvasHeight="canvasHeight"
      :width="width"
      :height="height"
      :palette="paletteStyle"
      :gridRatio="gridRatio"
      :autoCenter="false"
    >
      <div>图表</div>
    </sketch-rule>
  </div>
</template>
<script lang='ts' setup>
import { ref, reactive } from 'vue'
import 'vue3-sketch-ruler/lib/style.css'
import SketchRule from 'vue3-sketch-ruler'

const scale = ref(1) // 初始化标尺的缩放及画布
const rate = ref(1) // 初始化标尺的缩放
const thick = ref(20) // 标尺的厚度
const width = ref(1920) // 放置标尺窗口的宽度
const height = ref(1080) // 放置标尺窗口的高度
const canvasWidth = ref(1920) // 画布宽
const canvasHeight = ref(1080) // 画布高
const gridRatio = ref(0.5) // 刻度分散比例(颗粒度)





const paletteStyle = ref({
  bgColor: "transparent", 
  lineType: "dashed",
  longfgColor: '#4d4d4d',
  shortfgColor: '#1d2129',
  fontColor: '#1d2129',
  shadowColor: '#18181c',
  borderColor: '#18181c',
  cornerActiveColor: '#18181c'
})

</script>
<style lang='less' scoped>

.layContent {
  width: 100%;
  height: 100%;
  position: absolute;
  z-index: 0;
}
.wrapper {
  background-size: 15px 15px, 15px 15px;
  border: 1px solid #dadadc;

}
.whitewrapper {
  background-color: #fafafc;
  background-image: linear-gradient(#fafafc 14px, transparent 0),
    linear-gradient(90deg, transparent 14px, #373739 0);
}
</style>
