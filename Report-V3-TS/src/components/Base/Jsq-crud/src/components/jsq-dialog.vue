<template>
  <basicModal @register="register" v-bind="attrs">
    11111
    22222
    3333333
    44444444
    555555555
    666666666
    7777777777
    8888888
    99999999
    11111111
  </basicModal>
</template>
<script lang='ts' setup>
  import { useAttrs } from 'vue'
  import { basicModal, useModal } from '@/components/Modal'

  const attrs = useAttrs()
  console.log('11', attrs)

  const [register, { openModal }] = useModal({
    title: '新增'
  })

  const initModel = () => {
    openModal()
  }

  defineExpose({
    initModel
  })
</script>
<style lang='less' scoped></style>
