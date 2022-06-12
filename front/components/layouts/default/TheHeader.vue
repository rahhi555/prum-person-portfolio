<script lang="ts" setup>
</script>

<template>
  <header class="header">
    <NuxtLink class="header-title" to="/top">My Portfolio</NuxtLink>
    <button class="login-btn">
      <NuxtLink class="login-btn-font" to="/login">
        ログイン
      </NuxtLink>
    </button>
  </header>  
</template>

<style scoped>
.header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0px 40px;
  gap: 10px;
  height: 120px;

  background-color: var(--primary-color);
}

.header-title {
width: 201px;
height: 42px;

font-weight: 700;
font-size: 36px;
line-height: 42px;

color: #FFFFFF;
}

.login-btn {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  padding: 16px 40px;

  width: 152px;
  height: 53px;

  background: #FFFFFF;
  border-radius: 4px;
}

.login-btn-font {
width: 72px;
height: 21px;

font-size: 18px;
line-height: 21px;

color: rgba(0, 0, 0, 0.75);
}
</style>
