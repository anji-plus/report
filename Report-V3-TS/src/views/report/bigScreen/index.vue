<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 16:34:50
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-10 20:28:11
-->
<template>
  <div class="view-container">
    <div class="search">
      <n-form
        size="small"
        label-placement="left"
        :model="formModel"
        ref="formElRef"
      >
        <div class="search-form">
          <n-grid :x-gap="12" :y-gap="8" :cols="3">
            <n-gi>
              <n-form-item label="姓名">
                <n-input v-model:value="formModel.reportCode" placeholder="名称" />
              </n-form-item>
            </n-gi>
            <n-gi>
              <n-form-item label="报表编码">
                <n-input v-model:value="formModel.reportName" placeholder="报表编码" />
              </n-form-item>
            </n-gi>
            <n-gi>
              <n-space>
                <n-button size="small" @click="toRestForm">重置</n-button>
                <n-button type="primary" size="small" @click="getData">查询</n-button>
              </n-space> 
            </n-gi>
          </n-grid>
        </div>
    </n-form>
    </div>
    <div class="card">
      <n-grid x-gap="24" :cols="4">
        <n-gi class="bg" v-for="(item, index) in list">
          <img
            class="bg-img"
            :src="!item.reportImage ? requireImg('../../../assets/images/charts.jpg') : item.reportImage"
            alt=""
          />
          <div class="content">
            <header>{{ item.reportName }}</header>
            <footer>
              {{ item.updateTime }}
              <div class="operation">
                <n-button quaternary circle type="success">
                  <template #icon>
                    <n-icon><CashIcon /></n-icon>
                  </template>
                </n-button>
                <n-button quaternary circle type="warning">
                  <template #icon>
                    <n-icon><CashIcon /></n-icon>
                  </template>
                </n-button>
                <n-button quaternary circle type="error">
                  <template #icon>
                    <n-icon><CashIcon /></n-icon>
                  </template>
                </n-button>
              </div>
            </footer>
          </div>
        </n-gi>
      </n-grid>
    </div>
    <div class="pagination">
      <n-pagination  
        :page-count="pages"
        show-size-picker
        :page-sizes="[8, 24, 64, 80]"
        show-quick-jumper 
        :displayOrder="['pages', 'quick-jumper', 'size-picker']"
        @update:page="handlePage"
        @update:page-size="handlePageSize"  
      />
    </div>
  </div>
</template>
<script lang="ts" setup>
import { CashOutline as CashIcon } from '@vicons/ionicons5'
  import { reactive, onMounted, ref } from 'vue'
  import { getPageList } from '@/api/report/bigScreen'

  interface formProps {
    reportCode: string;
    reportName: string;
    reportType: string;
    pageNumber: number;
    pageSize: number;
    order: 'DESC' | 'ASC';
    sort: string
  }

  const formModel = reactive<formProps>({
    reportCode: "",
    reportName: "",
    reportType: "report_screen",
    pageNumber: 1,
    pageSize: 8,
    order: "DESC",
    sort: "update_time"
  })
  const pages = ref<number>(0)
  const list = ref<Recordable[]>()

  const getParams = () => {
    return formModel
  }

  const getData = async () => {
    const params = getParams()
    const { code, data } = await getPageList(params)
    if(code != 200) return
    list.value = data.records
    pages.value = data.pages
    console.log(data)
  }

  const toRestForm = () => {
    formModel.pageNumber = 1
    formModel.pageSize = 8
    formModel.reportCode = ''
    formModel.reportName = ''
  }

  const handlePage = (page: number) => {
    formModel.pageNumber = page
    getData()
  }

  // 分页条数
  const handlePageSize = (pageSizes: number) => {
    formModel.pageNumber = 1
    formModel.pageSize = pageSizes
    getData()
  }

  const requireImg = (name: string) => {
    return new URL(`${name}`, import.meta.url).href
  }
  onMounted(() => {
    getData()
  })

</script>
<style lang="less" scoped>
.view-container {
  width: 100%;
  height: calc(100vh - 118px);
  background: #fff;
  padding: 20px 10px;
  margin-left: 6px;
  .card {
    height: calc(100vh - 250px);
    overflow-y: auto;
  }
  .search {
    border-bottom: 1px solid #dbdde3;
  }
  .bg {
    width: 100%;
    height: 200px;
    position: relative;
    overflow: hidden;
    margin: 10px 0;
    border: 12px solid white;
  }

  .bg .bg-img {
    position: absolute;
    width: 100%;
    height: 100%;
    filter: blur(6px);
    z-index: 2;
  }
  header {
    font-size: 24px;
    text-align: center;
    line-height: 80px;
  }
  .content {
    width: 100%;
    height: 100%;
    position: absolute;
    color: #fff;
    left: 0;
    top: 0;
    z-index: 3;
  }
  footer {
    width: 100%;
    font-size: 14px;
    padding: 16px;
    line-height: 30px;
    position: absolute;
    z-index: 3;
    bottom: 0;
    .operation {
      float: right;
      .view,
      .edit {
        color: #fff;
        font-size: 14px;
      }
    }
  }
  .pagination {
    margin-top: 20px;
  }
}
</style>

