/*
 * @Descripttion: 监控视频组件json
 * @version:
 * @Author: lishuaiwu
 * @Date: 2025-06-06 11:35:23
 */
export const widgetVideoMonitor = {
  code: 'widget-videoMonitor',
  type: 'text',
  tabName: '文本栏',
  label: '监控视频',
  icon: 'iconshipin',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '监控视频',
      },
      {
        type: 'vue-color',
        label: '背景色',
        name: 'videoBgColor',
        require: false,
        placeholder: '',
        value: 'rgba(10, 115, 255, .8)',
      },
      {
        type: 'el-input-number',
        label: '圆角',
        name: 'borderRadius',
        require: false,
        placeholder: '',
        value: 10
      },
      [
        {
          name: '列表样式',
          list: [
            {
              type: 'vue-color',
              label: '背景色',
              name: 'videoListBgColor',
              require: false,
              placeholder: '',
              value: 'rgb(0, 59, 81)',
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'videoListFontColor',
              require: false,
              placeholder: '',
              value: 'rgb(255, 255, 255)',
            },
            {
              type: 'el-input-number',
              label: '字号',
              name: 'fontSize',
              require: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'el-input-number',
              label: '最小宽度',
              name: 'minWidth',
              require: false,
              placeholder: '',
              value: 200
            },
            {
              type: 'vue-color',
              label: '选中背景色',
              name: 'activeBgColor',
              require: false,
              placeholder: '',
              value: 'rgba(10, 39, 50, 1)',
            },
            {
              type: 'vue-color',
              label: '选中文字颜色色',
              name: 'activeFontColor',
              require: false,
              placeholder: '',
              value: 'rgba(255, 255, 255, 1)',
            },
          ]
        }
      ],
      {
        type: 'el-switch',
        label: '自动播放首视频',
        name: 'isAutoPlayFirst',
        required: false,
        placeholder: '',
        value: false,
      },
      {
        type: 'el-switch',
        label: '显示播放列表',
        name: 'isShowList',
        required: false,
        placeholder: '',
        value: true,
      },
    ],
    data: [
      {
        type: 'el-radio-group',
        label: '数据类型',
        name: 'dataType',
        require: false,
        placeholder: '',
        selectValue: true,
        selectOptions: [
          {
            code: 'staticData',
            name: '静态数据',
          },
          {
            code: 'dynamicData',
            name: '动态数据',
          },
        ],
        value: 'staticData',
      },
      {
        type: 'el-input-number',
        label: '刷新时间(毫秒)',
        name: 'refreshTime',
        relactiveDom: 'dataType',
        relactiveDomValue: 'dynamicData',
        value: 600000
      },
      {
        type: 'el-button',
        label: '静态数据',
        name: 'staticData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        relactiveDomValue: 'staticData',
        value: [
          {
            "name": "测试视频-mp4",
            "src": 'https://www.w3cschool.cn/statics/demosource/movie.mp4'
          },
          {
            "name": "测试视频-flv",
            "src": 'https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/flv/xgplayer-demo-360p.flv'
          }
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        relactiveDomValue: 'dynamicData',
        chartType: 'widget-videoMonitor',
        dictKey: 'MONITOR_PROPERTIES',
        value: '',
      }
    ],
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
        value: 600,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 400,
      },
    ]
  }
}
