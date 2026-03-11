<template>
  <main class="home-container">
    <header class="glass-header">
      <div class="header-content">
        <h1>CMS 探索版</h1>
        <div class="avatar"></div>
      </div>
    </header>

    <div class="scroll-area">
      <!-- 欢迎卡片 -->
      <section class="hero-section">
        <h2>探索视界</h2>
        <p>今日为你精选的最新内容</p>
      </section>

      <!-- 分类入口 -->
      <section class="categories-section">
        <div 
          v-for="cat in categories" 
          :key="cat.id" 
          class="category-card"
        >
          <span class="cat-icon">{{ cat.icon || '📌' }}</span>
          <span class="cat-name">{{ cat.name }}</span>
        </div>
      </section>

      <!-- 热门信息流 -->
      <section class="feed-section">
        <h3 class="section-title">最新资讯 (开发中)</h3>
        <div class="feed-grid">
          <article class="feed-item" v-for="i in 5" :key="i">
            <div class="feed-image"></div>
            <div class="feed-content">
              <h4>探索未知宇宙的边界与黑洞奥秘</h4>
              <p class="feed-meta">前端CMS系统同步 · 2小时前</p>
            </div>
          </article>
        </div>
      </section>
    </div>

    <!-- 底部炫酷导航 -->
    <nav class="bottom-nav glass-nav">
      <div class="nav-item active"><span class="icon">🧭</span></div>
      <div class="nav-item"><span class="icon">🔥</span></div>
      <div class="nav-item fab"><span class="icon">+</span></div>
      <div class="nav-item"><span class="icon">🔔</span></div>
      <div class="nav-item"><span class="icon">👤</span></div>
    </nav>
  </main>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { getCategories } from '../api';

const categories = ref<any[]>([]);

onMounted(async () => {
  categories.value = await getCategories();
});
</script>

<style scoped>
.home-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
}

.glass-header {
  position: sticky;
  top: 0;
  z-index: 100;
  backdrop-filter: blur(12px);
  background: var(--glass-bg);
  border-bottom: 1px solid var(--glass-border);
  padding: 1rem 1.5rem;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header-content h1 {
  font-size: 1.25rem;
  font-weight: 700;
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  -webkit-background-clip: text;
  color: transparent;
  margin: 0;
}

.avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
}

.scroll-area {
  flex: 1;
  overflow-y: auto;
  padding: 1.5rem;
  padding-bottom: 6rem; /* space for bottom nav */
}

/* Hero Section */
.hero-section {
  margin-bottom: 2rem;
}

.hero-section h2 {
  font-size: 2rem;
  font-weight: 800;
  letter-spacing: -0.05em;
  margin-bottom: 0.5rem;
}

.hero-section p {
  color: var(--text-muted);
  font-size: 0.95rem;
}

/* Categories Section */
.categories-section {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
  margin-bottom: 2.5rem;
}

.category-card {
  background: var(--glass-bg);
  border: 1px solid var(--glass-border);
  border-radius: 16px;
  padding: 1.2rem;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  transition: transform 0.2s, box-shadow 0.2s;
  cursor: pointer;
}

.category-card:active {
  transform: scale(0.95);
  background: rgba(255,255,255,0.1);
}

.cat-icon {
  font-size: 1.8rem;
  margin-bottom: 0.5rem;
}

.cat-name {
  font-weight: 600;
  font-size: 0.95rem;
}

/* Feed Section */
.section-title {
  font-size: 1.2rem;
  font-weight: 700;
  margin-bottom: 1rem;
}

.feed-grid {
  display: flex;
  flex-direction: column;
  gap: 1.2rem;
}

.feed-item {
  background: rgba(255,255,255,0.02);
  border: 1px solid rgba(255,255,255,0.05);
  border-radius: 16px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.feed-image {
  height: 160px;
  background: linear-gradient(45deg, #1e293b, #334155);
}

.feed-content {
  padding: 1rem;
}

.feed-content h4 {
  font-size: 1rem;
  margin-bottom: 0.5rem;
  line-height: 1.4;
}

.feed-meta {
  font-size: 0.8rem;
  color: var(--text-muted);
}

/* Bottom Nav */
.bottom-nav {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 0.8rem 1.5rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top: 1px solid var(--glass-border);
  backdrop-filter: blur(20px);
  background: rgba(15, 23, 42, 0.8);
  padding-bottom: env(safe-area-inset-bottom, 1rem);
}

.nav-item {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  color: var(--text-muted);
  font-size: 1.2rem;
  transition: all 0.3s ease;
}

.nav-item.active {
  color: #fff;
}

.nav-item.fab {
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  color: white;
  transform: translateY(-15px);
  box-shadow: 0 10px 20px rgba(236, 72, 153, 0.3);
  font-size: 1.5rem;
  font-weight: normal;
}
</style>
