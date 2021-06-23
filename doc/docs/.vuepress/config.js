module.exports = {
    base: '/doc/',
    title: '大屏设计',
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
            {text: '文档', link: '/guide/'},
            {text: 'GitHub', link: 'https://github.com/anji-plus/report'},
            {text: 'Gitee', link: 'https://gitee.com/anji-plus/report'},
        ],
        sidebar: {
            '/guide/': [
                {
                    title: '文档',
                    collapsable: false,
                    children: [
                        {title: '介绍', path: '/guide/'},
                        {title: '快速了解', path: '/guide/quickly'},
                        {title: '项目介绍', path: '/guide/productintro'},
                        {title: '系统运行', path: '/guide/deploy'},
                        {title: '开发手册', path: '/guide/devdoc'}
                    ]
                },
                {
                    title: '盖亚底盘',
                    collapsable: false,
                    children: []
                },
                {
                    title: '其他',
                    collapsable: false,
                    children: [
                        {title: '常见问题', path: '/guide/question'}
                    ]
                }],
        }
    }
}
