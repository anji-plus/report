module.exports = {
    base: '/report-doc/',
    title: 'AJ-Report',
    head: [
        ['link', { rel: 'icon', href: '/favicon.ico' }],
        ['link', { rel: 'shortcut icon', href: '/favicon.ico' }],
    ],
    description: '使用拖拽快速生成动态大屏报表',
    dest: 'dist',
    lastUpdated: 'Last Updated',
    theme: '',
    themeConfig: {
        logo: '/logo.png',
        smoothScroll: true,
        sidebarDepth: 2,
        nav: [
            {text: '首页', link: '/'},
            {text: '指南', link: '/guide/'},
            {text: 'GitHub', link: 'https://github.com/anji-plus/report'},
            {text: 'Gitee', link: 'https://gitee.com/anji-plus/report'},
            {text: '更多大屏', link: '/guide/bigScreenCase'},
        ],
        sidebar: {
            '/guide/': [
                {
                    title: '介绍',
                    collapsable: false,
                    children: [
                        {title: '简介', path: '/guide/'},
                        {title: '技术支持', path: '/guide/briefSupport'},
                        {title: '更多大屏', path: '/guide/bigScreenCase'},
                    ]
                },
                {
                    title: 'Releases',
                    collapsable: false,
                    children: [
                        {title: 'V1.0.x', path: '/guide/releases/1.0.x'},
                        {title: 'V1.1.x', path: '/guide/releases/1.1.x'},
                        {title: 'V1.2.x', path: '/guide/releases/1.2.x'},
                        {title: 'V1.3.x', path: '/guide/releases/1.3.x'},
                        {title: 'V1.4.x', path: '/guide/releases/1.4.x'},
                        {title: 'V1.5.x', path: '/guide/releases/1.5.x'},
                        {title: 'V1.6.x', path: '/guide/releases/1.6.x'},
                        {title: 'V1.7.x', path: '/guide/releases/1.7.x'},
                    ]
                },
                {
                    title: '快速入门',
                    collapsable: false,
                    children: [
                        {title: '开发环境', path: '/guide/quicklyDevelop'},
                        {title: '发行版部署', path: '/guide/quicklyDistribution'},
                        {title: '源码部署', path: '/guide/quicklySource'},
                        {title: '前后端分离', path: '/guide/quicklySeparate'},
                        {title: '快速使用', path: '/guide/quicklyUse'},
                    ]
                },
                {
                    title: '用户权限',
                    collapsable: false,
                    children: [
                        {title: '权限管理', path: '/guide/authManager'},
                    ]
                },
                {
                    title: '操作手册',
                    collapsable: false,
                    children: [
                        {title: '数据源', path: '/guide/datasource'},
                        {title: '数据集', path: '/guide/dataset'},
                        {title: '报表管理', path: '/guide/reportManager'},
                        {title: '大屏报表', path: '/guide/dashboard'},
                        {title: '表格报表', path: '/guide/excel'},
                        {title: '导入导出', path: '/guide/importExport'},
                        {title: '报表分享', path: '/guide/reportShare'},
                        {title: '图表配置项', path: '/guide/chartsConfig'},
                        {title: '图表组件', path: '/guide/charts'},
                        {title: '图表联动', path: '/guide/chartsLinkage'},
                    ]
                },
                {
                    title: '其他',
                    collapsable: false,
                    children: [
                        {title: '常见问题', path: '/guide/question'},
                        {title: '常用知识', path: '/guide/knowledge'}
                    ]
                },
                {
                    title: '社区提供',
                    collapsable: false,
                    children: [
                        {title: '说明', path: '/guide/community/report'},
                        {title: '搭建AJ-Report开发环境', path: '/guide/community/AC1688/搭建aj-report开发环境'},
                        {title: '大屏组件对齐和拖拽实现', path: '/guide/community/JiangHH/AJ_Report大屏设计时多组件对齐和拖拽移动实现'},
                        {title: '按钮控制多图表联动实现', path: '/guide/community/JiangHH/按钮组件控制多条件组件联动图表实现'}
                    ]
                }
            ],
        }
    },
    plugins: [
        ['@vuepress/back-to-top', true],
    ],
    configureWebpack: {
        resolve: {
            alias: {
                '@': '/.vuepress/public'
            }
        }
    }
}
