/*
 * @Descripttion: iframe json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:17:55
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-11 13:17:35
 */
export const widgetIframe = {
  code: 'widget-iframe',
  type: 'text',
  tabName: '文本栏',
  label: '内联框架',
  icon: 'iconkuangjia',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: 'iframe',
      },
      {
        type: 'el-select',
        label: '切换动画',
        name: 'transitionEffect',
        required: false,
        placeholder: '请选择切换动画效果',
        selectOptions: [
          {name: '无动画', code: 'none'},
          {name: '淡入淡出', code: 'fade'},
          {name: '滑动', code: 'slide'},
          {name: '缩放', code: 'zoom'}
        ],
        value: 'none',
      },
      {
        type: 'el-input-number',
        label: '切换间隔(秒)',
        name: 'autoSwitchInterval',
        required: false,
        placeholder: '0表示不自动切换',
        value: 0,
      },
      {
        type: 'multiIframeManager',
        label: 'iframe地址管理',
        name: 'iframeUrls',
        required: false,
        value: [{
          name: '默认地址',
          url: 'https://ajreport.beliefteam.cn/index.html'
        }],
      },
    ],
    // 数据
    data: [],
    // 坐标
    position: [
      {
        type: 'el-input-number',
        label: '左边距',
        name: 'left',
        required: false,
        placeholder: '',
        value: 0,
      },
      {
        type: 'el-input-number',
        label: '上边距',
        name: 'top',
        required: false,
        placeholder: '',
        value: 0,
      },
      {
        type: 'el-input-number',
        label: '宽度',
        name: 'width',
        required: false,
        placeholder: '该容器在1920px大屏中的宽度',
        value: 300,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 200,
      },
    ],
  }
}
