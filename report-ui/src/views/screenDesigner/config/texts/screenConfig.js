/*
 * @Descripttion: 大屏配置
 * @version:
 * @Author: qianlishi
 * @Date: 2022-03-09 19:45:37
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-03-09 19:59:18
 */
export const screenConfig = {
  code: 'screen',
  type: 'screen',
  label: '大屏设置',
  icon: '',
  options: {
    setup: [
      {
        type: 'el-input-number',
        label: '大屏宽度',
        name: 'width',
        required: false,
        placeholder: 'px',
        value: '1920',
      },
      {
        type: 'el-input-number',
        label: '大屏高度',
        name: 'height',
        required: false,
        placeholder: 'px',
        value: '1080',
      },
      {
        type: 'el-input-text',
        label: '标题',
        name: 'title',
        require: false,
        placeholder: '',
        value: '大屏',
      },
      {
        type: 'el-input-textarea',
        label: '大屏简介',
        name: 'description',
        required: false,
        placeholder: '',
      },
      {
        type: 'vue-color',
        label: '背景颜色',
        name: 'backgroundColor',
        required: false,
        placeholder: '',
        value: '#000',
      },
      {
        type: 'custom-upload',
        label: '图片地址',
        name: 'backgroundImage',
        required: false,
        placeholder: '',
        value: 'https://ajreport.beliefteam.cn/file/download/bf566e48-ccad-40e1-8ee9-228427e5466b',
      },
    ],
    data: [],
    position: [],
  }
}
