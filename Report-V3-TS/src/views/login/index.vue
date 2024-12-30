<template>
  <div class="view-account">
    <div class="view-account-header">
      <div class="view-account-header-left">
        <div class="view-account-header-left-logo">
          <img src="@/assets/imgs/logo-dp.png" alt="" />
        </div>
        <div class="view-account-header-left-desc">{{ websiteConfig.loginDesc }}</div>
      </div>
      <div class="view-account-header-right">
        <div class="view-account-header-right-item" v-for="(item, index) in docs" :key="index">
          <a :href="item.href" target="_blank">{{ item.name }}</a>
        </div>
      </div>
    </div>
    <div class="view-account-container">
      <div class="view-account-box">
          <div class="view-account-top">
          <div class="view-account-top-desc">{{ websiteConfig.loginDesc }}</div>
        </div>
        <div class="view-account-form">
          <n-form ref="formRef" label-placement="left" size="large" :model="formInline" :rules="rules">
            <n-form-item path="loginName">
              <n-input v-model:value="formInline.loginName" placeholder="请输入用户名">
                <template #prefix>
                  <n-icon size="18" color="#808695">
                    <PersonOutline />
                  </n-icon>
                </template>
              </n-input>
            </n-form-item>
            <n-form-item path="password">
              <n-input v-model:value="formInline.password" type="password" showPasswordOn="click" placeholder="请输入密码">
                <template #prefix>
                  <n-icon size="18" color="#808695">
                    <LockClosedOutline />
                  </n-icon>
                </template>
              </n-input>
            </n-form-item>
            <n-form-item class="default-color">
              <div class="flex justify-between">
                <div class="flex-initial">
                  <n-checkbox v-model:checked="autoLogin">记住密码</n-checkbox>
                </div>
              </div>
            </n-form-item>
            <n-form-item>
              <n-button type="primary" @click="handleSubmit" size="large" :loading="loading" block>
                登录
              </n-button>
            </n-form-item>
          </n-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { reactive, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { useUserStore } from '@/store/modules/user';
import { useMessage } from 'naive-ui';
import { ResultEnum } from '@/enums/httpEnum';
import { PersonOutline, LockClosedOutline } from '@vicons/ionicons5';
import { PageEnum } from '@/enums/pageEnum';
import { websiteConfig } from '@/config/website.config';
import { transPsw } from "@/utils/encrypted";
interface FormState {
  loginName: string;
  password: string;
}
interface Docs {
  name: string;
  href: string;
}
const docs = reactive<Docs[]>([
  {
    name: '文档',
    href: 'https://ajreport.beliefteam.cn/report-doc/'
  },
  {
    name: '社区',
    href: 'https://gitee.com/anji-plus/report'
  }
])

const formRef = ref();
const message = useMessage();
const loading = ref(false);
const autoLogin = ref(true);
const LOGIN_NAME = PageEnum.BASE_LOGIN_NAME;

const formInline = reactive({
  loginName: 'admin',
  password: '7Y8_LdkSL#1c@V_Pe',
});

const rules = {
  loginName: { required: true, message: '请输入用户名', trigger: 'blur' },
  password: { required: true, message: '请输入密码', trigger: 'blur' },
};

const userStore = useUserStore();

const router = useRouter();
const route = useRoute();

const handleSubmit = (e) => {
  e.preventDefault();
  formRef.value.validate(async (errors) => {
    if (!errors) {
      const { loginName, password } = formInline;
      message.loading('登录中...');
      loading.value = true;

      const params: FormState = {
        loginName,
        password: transPsw(password),
      };

      try {
        const { code, message: msg } = await userStore.login(params);
        message.destroyAll();
        if (code == ResultEnum.SUCCESS) {
          const toPath = decodeURIComponent((route.query?.redirect || '/') as string);
          message.success('登录成功，即将进入系统');
          if (route.name === LOGIN_NAME) {
            router.replace('/');
          } else router.replace(toPath);
        } else {
          message.info(msg || '登录失败');
        }
      } finally {
        loading.value = false;
      }
    } else {
      message.error('请填写完整信息，并且进行验证码校验');
    }
  });
};
</script>

<style lang="less" scoped>
.view-account {
  display: flex;
  flex-direction: column;
  height: 100vh;
  overflow: auto;
  &-header {
    height: 60px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    padding: 10px 60px;
    box-sizing: border-box;
    &-left {
      display: flex;
      align-items: center;
      padding-left: 24px;
      &-logo {
        width: 40px;
        height: 40px;
        margin-right: 10px;
        img {
          width: 100%;
          height: 100%;
        }
      }
      &-desc {
        font-size: 20px;
        font-weight: bold;
      }
    }
    &-right {
      display: flex;
      align-items: center;
      &-item {
        margin-left: 40px;
        a {
          color: #1a1a1a;
          font-size: 16px;
          &:hover{
            text-decoration: underline;
          }
        }
      }
    }
  }
  &-container {
    width: 100%;
    height: calc(100vh - 60px);
    background: url('@/assets/imgs/login.jpg') no-repeat;
    background-size: cover;
    position: relative;
  }
  &-box {
    position: absolute;
    top: 50%;
    right: 30%;
    -webkit-transform: translate(50%, -50%);
    transform: translate(50%, -50%);
    min-width: 400px;
    width: 22%;
    background-color: #ffffff;
    border-radius: 11px;
    padding: 30px;
    overflow: hidden;
  }
  &-top {
    padding: 32px 0;
    text-align: center;

    &-desc {
      font-size: 24px;
      color: #1a1a1a;
    }
  }

  &-other {
    width: 100%;
  }

  .default-color {
    color: #515a6e;

    .ant-checkbox-wrapper {
      color: #515a6e;
    }
  }
}

</style>
