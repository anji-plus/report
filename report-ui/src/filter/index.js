/*
 * @Descripttion: 
 * @version: 
 * @Author: qianlishi
 * @Date: 2021-12-11 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-12-13 13:40:00
 */

import { getStorageItem } from '@/utils/storage';
// 字典
export function basecode(value, dicName) {
  if (value === undefined || value === null) {
    return ''
  }
  if (dicName === undefined || dicName === null) {
    return value
  }

  let basecode = getStorageItem('queryForCodeSelect')
  let dictList = basecode[dicName]
  let dictLabel = value
  for (let i = 0; i < dictList.length; i++) {
    let codeItem = dictList[i]
    if(codeItem.value == value || codeItem.labelEng == value){
      dictLabel = codeItem.label
      break
    }
  }
  return dictLabel;
}


// 根据字典值获取数据
export function getDataByCode(keyCode) {
  let dict = basecode[this.keyCode]
  let list = []
  for (let key in dict) {
      list.push({
          'value': key,
          'text': dict[key]
      })
  }
  return list
}

//保留两位小数
export function fixed(value){
  let intVal = null;
  if(typeof value == 'string' && /^[0-9.]+$/.test(value)){
    intVal = parseInt(value);
  }
  if(typeof value == 'number'){
    intVal = value;
  }
  if(intVal == null){
    return value;
  }else{
    return (Math.round(value*100)/100).toFixed(2);
  }
}

// 时间戳转日期
export function formatTimestamp(value) {
  if (value == null) {
    return ''
  }
  let date = new Date(value)
  let y = date.getFullYear()
  let m = date.getMonth() + 1
  m = m < 10 ? ('0' + m) : m
  let d = date.getDate()
  d = d < 10 ? ('0' + d) : d
  let h = date.getHours()
  h = h < 10 ? ('0' + h) : h
  let minute = date.getMinutes()
  let second = date.getSeconds()
  minute = minute < 10 ? ('0' + minute) : minute
  second = second < 10 ? ('0' + second) : second
  return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second
}


// 时间戳转日期
export function formatDate(value) {
  if (value == null) {
    return ''
  }
  let date = new Date(value)
  let y = date.getFullYear()
  let m = date.getMonth() + 1
  m = m < 10 ? ('0' + m) : m
  let d = date.getDate()
  d = d < 10 ? ('0' + d) : d
  return y + '-' + m + '-' + d
}