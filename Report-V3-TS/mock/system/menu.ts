import { resultSuccess } from '../_util';

const menuList = () => {
  const result: any[] = [
    {
      label: 'Dashboard',
      key: 'dashboard',
      type: 1,
      subtitle: 'dashboard',
      openType: 1,
      auth: 'dashboard',
      path: '/dashboard',
      children: [
        {
          label: '主控台',
          key: 'console',
          type: 1,
          subtitle: 'console',
          openType: 1,
          auth: 'console',
          path: '/dashboard/console',
        },
      ],
    },
  ];

  return result;
};

export default [
  {
    url: '/api/menu/list',
    timeout: 1000,
    method: 'get',
    response: () => {
      const list = menuList();
      return resultSuccess({
        list,
      });
    },
  },
];
