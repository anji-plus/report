<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 16:34:50
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-13 20:32:32
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
  </div>
</template>
<script lang="ts" setup>
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { getFormSchemas, getTableButtons, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toDeleteApi, toUpdateApi, toGetDataDetailApi, reportShareDelay } from '@/api/report/shareManage'
  import { useMessage } from 'naive-ui'

  const messages = useMessage()

  // 批量删除
  const removeAll = () => {
    toRemoveAll()
  }

  // 删除
  const removeSingle = (row) => {
    toRemove(row)
  }

  // 复制url
  const toCopyUrl = (row) => {
    copyToClip(row.urlPath);
    messages.success('已将url路径复制至剪切板！')
  }

  // 延期 1 7 30
  const toShareDelay = async (row, day) => {
    const { code, message } = await reportShareDelay({ id: row.id, shareValidType: day })
    if(code == 200) {
      return messages.success('延期成功!')
    } 
    return messages.error(message)
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
  const { columns } = getTableColumns({ toCopyUrl, toShareDelay, removeSingle })

  const [register, { toRemoveAll, toRemove }] = useCrud({
    searchFormOption: {
      schemas: getFormSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive 按钮其他属性
      tableButtons: rowsButtons
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
</script>
<style lang="less" scoped></style>

