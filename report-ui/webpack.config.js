'use strict'
const path = require('path')
const MonacoWebpackPlugin = require('monaco-editor-webpack-plugin');

module.exports = {
  resolve: {
    extensions: ['.js', '.ts', '.vue', '.json', '.css', '.node', '.sass'],
    alias: {
      '@': path.resolve('src'),
      'vue$': 'vue/dist/vue.esm.js'
    }
  },
  plugins: [
    new MonacoWebpackPlugin()
  ]
}
