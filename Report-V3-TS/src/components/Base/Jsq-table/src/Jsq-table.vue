<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-04 15:57:09
-->
<template>
  <div class="table">
    <n-data-table
      :max-height="300"
      :columns="columns"
      :data="data"
      default-expand-all
    />
  </div>
  <div class="pagination">
    <n-pagination
      :display-order="['pages', 'quick-jumper', 'size-picker']"
      :page-count="100"
      show-quick-jumper
      show-size-picker
    />
  </div>

</template>
<script lang='ts' setup>
import type { DataTableColumns } from 'naive-ui'
import { NButton, NTag, useMessage } from 'naive-ui'
import { ref, h } from 'vue'

const data = ref()
const columns = ref()
const pagination = ref()

interface RowData {
  key: number
  name: string
  age: number
  address: string
  tags: string[]
}

function createColumns({
  sendMail
}: {
  sendMail: (rowData: RowData) => void
}): DataTableColumns<RowData> {
  return [
    {
      type: 'selection'
    },
    {
      type: 'expand',
      expandable: rowData => rowData.name !== 'Jim Green',
      renderExpand: (rowData) => {
        return `${rowData.name} is a good guy.`
      }
    },
    {
      title: '#',
      key: 'key',
      render: (_, index) => {
        return `${index + 1}`
      }
    },
    {
      title: 'Name',
      key: 'name'
    },
    {
      title: 'Age',
      key: 'age'
    },
    {
      title: 'Address',
      key: 'address'
    },
    {
      title: 'Tags',
      key: 'tags',
      render(row) {
        const tags = row.tags.map((tagKey) => {
          return h(
            NTag,
            {
              style: {
                marginRight: '6px'
              },
              type: 'info',
              bordered: false
            },
            {
              default: () => tagKey
            }
          )
        })
        return tags
      }
    },
    {
      title: 'Action',
      key: 'actions',
      render(row) {
        return h(
          NButton,
          {
            size: 'small',
            onClick: () => sendMail(row)
          },
          { default: () => 'Send Email' }
        )
      }
    }
  ]
}

function createData(): RowData[] {
  return [
    {
      key: 0,
      name: 'John Brown',
      age: 32,
      address: 'New York No. 1 Lake Park',
      tags: ['nice', 'developer']
    },
    {
      key: 1,
      name: 'Jim Green',
      age: 42,
      address: 'London No. 1 Lake Park',
      tags: ['wow']
    },
    {
      key: 2,
      name: 'Joe Black',
      age: 32,
      address: 'Sidney No. 1 Lake Park',
      tags: ['cool', 'teacher']
    },
    {
      key: 3,
      name: 'Joe Black',
      age: 32,
      address: 'Sidney No. 1 Lake Park',
      tags: ['cool', 'teacher']
    }
  ]
}

const message = useMessage()
data.value = createData()
columns.value =  createColumns({sendMail(rowData) {
          message.info(`send mail to ${rowData.name}`)
        }})
pagination.value = { pageSize: 10 }
</script>
<style lang='less' scoped>
.table {
  height: 300px;
  width: 100%;
  margin-top: 10px;
}
.pagination {
  float: right;
  margin-top: 10px;
}
</style>
