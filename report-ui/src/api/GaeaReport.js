import request from '@/utils/request'
import {getShareToken, getToken} from "@/utils/auth";
import axios from "axios";

// 设计报表
export function design(data) {
  return request({
    url: 'report/design',
    method: 'post',
    data,
  })
}

// 预览报表，渲染数据
export function preview(data) {
  return request({
    url: 'reportExcel/preview',
    method: 'post',
    headers: { 'Share-Token': getShareToken(), 'Authorization': getToken() },
    data,
  })
}

// 导出报表
export function exportExcel(data) {
/*  return request({
    url: 'reportExcel/exportExcel',
    method: 'post',
    data,
  })*/
  return new Promise((resolve) =>{
    axios({
      method:'post',
      url: process.env.BASE_API + '/reportExcel/exportExcel',
      //headers: { 'Authorization': getToken() },
      data,
      responseType:'blob'
    }).then(res =>{
      resolve(res.data);
    }).catch(err =>{
      resolve('error');
    })
  })
}

// 导出报表
export function exportPdf(data) {
  return request({
    url: 'reportExcel/exportPdf',
    method: 'post',
    data,
  })
}

//  获取所有数据集
export function queryAllDataSet() {
  return request({
    url: 'dataSet/queryAllDataSet',
    method: 'get',
  })
}

//  获取对应数据集的列集合
export function detail(data) {
  return request({
    url: 'dataSet/detailBysetId/' + data,
    method: 'get',
  })
}

//  获取对应数据集的列集合
export function detailBysetCode(data) {
  return request({
    url: 'dataSet/detailBysetCode/' + data,
    method: 'get',
  })
}

//  根据reportCode获取报表表格详情
export function detailByReportCode(data) {
  return request({
    url: 'reportExcel/detailByReportCode/' + data,
    method: 'get',
  })
}
