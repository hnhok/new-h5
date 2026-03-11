<template>
  <div class="login-page">
    <!-- 顶部导航栏 -->
    <header class="nav-bar">
      <div class="back-btn" @click="handleBack">
        <svg viewBox="0 0 24 24" fill="none" class="back-icon">
          <path d="M15 19L8 12L15 5" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      </div>
      <div class="nav-title">登录/注册</div>
      <div class="nav-right"></div>
    </header>

    <!-- 主体内容区 -->
    <main class="main-content">
      <!-- 视效发光图标 -->
      <div class="hero-icon-wrapper">
        <div class="icon-glow"></div>
        <div class="icon-circle">
          <svg viewBox="0 0 24 24" fill="none" class="mobile-icon">
            <rect x="6" y="2" width="12" height="20" rx="3" stroke="white" stroke-width="2"/>
            <circle cx="12" cy="18" r="1" fill="white"/>
          </svg>
        </div>
      </div>

      <!-- 欢迎标题 -->
      <h1 class="welcome-title">手机号验证登录</h1>
      <p class="welcome-subtitle">新用户将自动注册并登录</p>

      <!-- 登录表单 -->
      <div class="form-container">
        <!-- 手机号区域 -->
        <div class="input-group">
          <label>手机号</label>
          <input 
            type="tel" 
            v-model="phone" 
            placeholder="13375235237"
            class="input-field" 
          />
        </div>

        <!-- 验证码区域 -->
        <div class="input-group">
          <label>验证码</label>
          <div class="code-row">
            <input 
              type="text" 
              v-model="code" 
              placeholder="854591"
              class="input-field code-input" 
            />
            <button class="get-code-btn">获取验证码</button>
          </div>
        </div>
      </div>

      <!-- 提交按钮 -->
      <div class="submit-wrapper">
        <button class="submit-btn" @click="handleLogin">登录/注册</button>
      </div>

      <!-- 协议条款 -->
      <div class="terms">
        <span class="terms-text">登录即表示同意</span>
        <a href="#" class="terms-link">用户协议</a>
        <span class="terms-text">和</span>
        <a href="#" class="terms-link">隐私政策</a>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const phone = ref('');
const code = ref('');

const handleBack = () => {
  router.back();
};

const handleLogin = () => {
  // 模拟登录
  if (phone.value || code.value || true) {
    router.push('/');
  }
};
</script>

<style scoped>
/* ----------- 布局重置与基础主题 ----------- */
.login-page {
  min-height: 100vh;
  background-color: #0c0c0e; /* 极暗灰/纯黑背景 */
  color: #ffffff;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  display: flex;
  flex-direction: column;
}

/* ----------- 顶部导航栏 ----------- */
.nav-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 20px;
  position: relative;
  z-index: 10;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05); /* 极其微弱的分割线，图中不可见但我加了一点层次 */
}
.back-btn {
  width: 24px;
  height: 24px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
}
.back-icon {
  width: 20px;
  height: 20px;
  color: #ffffff;
}
.nav-title {
  font-size: 17px;
  font-weight: 500;
  letter-spacing: 0.5px;
}
.nav-right {
  width: 24px; /* 用于占位，保证主标题死居中 */
}

/* ----------- 主体内容区 ----------- */
.main-content {
  flex: 1;
  padding: 0 24px;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 40px;
}

/* ----------- 图标与光晕结构 ----------- */
.hero-icon-wrapper {
  position: relative;
  width: 80px;
  height: 80px;
  margin-bottom: 30px;
}
.icon-glow {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100px;
  height: 100px;
  background: radial-gradient(circle, rgba(139, 52, 235, 0.6) 0%, rgba(59, 130, 246, 0.5) 40%, rgba(12, 12, 14, 0) 70%);
  filter: blur(15px);
  z-index: 1;
  border-radius: 50%;
}
.icon-circle {
  position: absolute;
  top: 0;
  left: 0;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: linear-gradient(135deg, #a134eb 0%, #3b82f6 100%);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 2;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}
.mobile-icon {
  width: 32px;
  height: 32px;
}

/* ----------- 标题文本 ----------- */
.welcome-title {
  font-size: 24px;
  line-height: 1.4;
  margin: 0 0 10px 0;
  font-weight: 700;
  letter-spacing: 0.5px;
}
.welcome-subtitle {
  font-size: 14px;
  color: #8c8c8e;
  margin: 0 0 40px 0;
  font-weight: 400;
}

/* ----------- 表单区域 ----------- */
.form-container {
  width: 100%;
}
.input-group {
  margin-bottom: 24px;
  display: flex;
  flex-direction: column;
}
.input-group label {
  font-size: 13px;
  color: #a0a0a5;
  margin-bottom: 8px;
}
.input-field {
  width: 100%;
  background-color: #161618;
  border: 1px solid #2a2a2d;
  border-radius: 12px;
  padding: 16px;
  font-size: 16px;
  color: #ffffff;
  outline: none;
  box-sizing: border-box;
  transition: border-color 0.2s;
}
.input-field::placeholder {
  color: #606065;
}
.input-field:focus {
  border-color: #6366f1;
}

/* 验证码排列 */
.code-row {
  display: flex;
  gap: 12px;
}
.code-input {
  flex: 1;
}
.get-code-btn {
  background: linear-gradient(135deg, #9d3bf6 0%, #2f69ff 100%);
  color: #fff;
  border: none;
  border-radius: 12px;
  padding: 0 20px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  white-space: nowrap;
  outline: none;
}
.get-code-btn:active {
  opacity: 0.8;
}

/* ----------- 悬浮重型主按钮 ----------- */
.submit-wrapper {
  width: 100%;
  margin-top: 10px;
  position: relative;
}
/* 给大按钮底下一个弥散发光体 */
.submit-wrapper::after {
  content: '';
  position: absolute;
  top: 100%;
  left: 10%;
  right: 10%;
  height: 20px;
  background: linear-gradient(135deg, #a134eb 0%, #3b82f6 100%);
  filter: blur(20px);
  opacity: 0.6;
  z-index: 0;
  transform: translateY(-10px);
}
.submit-btn {
  width: 100%;
  background: linear-gradient(135deg, #8b3cfc 0%, #2f6afc 100%);
  color: #ffffff;
  border: none;
  border-radius: 14px;
  padding: 18px 0;
  font-size: 18px;
  font-weight: 500;
  letter-spacing: 1px;
  position: relative;
  z-index: 1;
  cursor: pointer;
}
.submit-btn:active {
  transform: scale(0.98);
}

/* ----------- 底部协议保护 ----------- */
.terms {
  margin-top: 24px;
  font-size: 12px;
  text-align: center;
}
.terms-text {
  color: #6b6b6e;
}
.terms-link {
  color: #a855f7; /* 与原文高度相似的魅紫红 */
  text-decoration: none;
  margin: 0 4px;
}
</style>
