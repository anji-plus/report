<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
<div>

</div>
</template>
<script>
import { reportShareDetailByCode} from '@/api/reportShare'
import { setShareToken } from '@/utils/auth'
export default {
  name: "Report",
  components: {
  },
  data() {
    return {

    };
  },

  created() {
    this.handleOpen()
  },
  methods: {
    async handleOpen() {
      const url = window.location.href
      const shareCode = url.substring(url.lastIndexOf("/") + 1);
      console.log(shareCode)

      const {code, data} = await reportShareDetailByCode(shareCode)
      if (code != '200') return
      setShareToken(data.shareToken)
      //将shareToken缓存在浏览器
      //跳转至大屏预览页面
      this.$router.push({
        path: '/bigscreen/viewer',
        query: {
          reportCode: data.reportCode
        },
      })

    },

  }
};
</script>
