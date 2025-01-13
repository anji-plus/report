<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:38:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-13 19:49:39
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register">
      <template #tabBtn-fileUpload>
        <n-upload
          :show-file-list="false"
          :action="uploadImgs"
          :headers="headers"
          @finish="uploadFinish"
        >
          <n-button type="primary" size="small">文件上传</n-button>
        </n-upload>
      </template>
    </JsqCrud>
  </div>
</template>
<script lang="ts" setup>
  import { onMounted, ref } from 'vue'
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { getFormSchemas, getTableButtons, getDialogRecordingSchemas, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toUpdateApi, toDeleteApi, toGetDataDetailApi } from '@/api/system/fileManage'
  import { useMessage } from 'naive-ui'
  import { useGlobSetting } from '@/hooks/setting';
  import { useUserStore } from '@/store/modules/user';
  
  const messages = useMessage()
  const userStore = useUserStore();

  const globSetting = useGlobSetting();
  const uploadImgs = globSetting.apiUrl + '/file/upload'
  const headers = ref({
    'authorization': userStore.token
  })

  const uploadFinish = ({ event: Event }) => {
    const { code, message } = eval('(' + Event.target.response + ')');
    if(code == 200){
      toQuery()
      return messages.success('文件上传成功')
    }
    return messages.success(message)
  }

  // 批量删除
  const removeAll = () => {
    toRemoveAll()
  }

  // 复制url
  const toCopyUrl = (row) => {
    copyToClip(row.urlPath);
    messages.success('已将url路径复制至剪切板！')
  }

  // 下载
  const toDownLoad = (row) => {
    window.open(row.urlPath);
  }

  // 删除
  const removeSingle = (row) => {
    toRemove(row)
  }

  const copyToClip = (content) => {
    let aux = document.createElement("input");
    aux.setAttribute("value", content);
    document.body.appendChild(aux);
    aux.select();
    document.execCommand("copy");
    document.body.removeChild(aux);
  }

  const { rowsButtons } = getTableButtons({ removeAll })
  const { columns } = getTableColumns({ toCopyUrl, removeSingle, toDownLoad })

  const [register, { toRemoveAll, toRemove, toQuery }] = useCrud({
    autoLoad: false, // 表格是否自动请求
    searchFormOption: {
      schemas: getFormSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive 按钮其他属性
      tableButtons: rowsButtons
    },
    dialogRecordingData: {
      width: 800,
      size: "small",
      labelPlacement: "left",
      labelWidth: 100,
      schemas: getDialogRecordingSchemas()
    },
    tableOptions: {
      // navie table配置
      columns: columns, // 表格配置
    },
    apiOptions: {
      queryApi: toGetPageList, // 查询
      addApi: toAddApi, // 新增
      removeApi: toDeleteApi, // 删除
      updateApi: toUpdateApi, // 修改
      getDataByIdApi: toGetDataDetailApi // 查询详情页
    }
  });

  onMounted(() => {
    toQuery({ order: 'DESC', sort: 'create_time' })
  })
  
</script>
<style lang="less" scoped>
</style>
