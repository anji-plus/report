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
            {text: '指南', link: '/guide/'},
            {text: '操作手册', link: '/operation/'},
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
                        {title: '快速入门', path: '/guide/quickly'},
                        // {title: '系统运行', path: '/guide/deploy'}
                    ]
                },
                {
                    title: '其他',
                    collapsable: false,
                    children: [
                        {title: '常见问题', path: '/guide/question'}
                    ]
                }],
            '/operation/': [
                {
                    title: '操作手册',
                    collapsable: false,
                    children: [
                        {title: '数据源', path: '/operation/datasource'},
                        {title: '数据集', path: '/operation/dataset'},
                        {title: '大屏设计', path: '/operation/dashboard'},
                        {title: '国际化', path: '/operation/i18n'},
                        {title: '字典', path: '/operation/dict'},
                    ]
                }
            ]
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
