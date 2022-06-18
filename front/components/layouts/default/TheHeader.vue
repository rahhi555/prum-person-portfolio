<script lang="ts" setup>
const { currentUser, logout } = useCurrentUser()
</script>

<template>
  <header class="header">
    <NuxtLink class="header-title" to="/">My Portfolio</NuxtLink>
    <button v-if="currentUser" class="login-btn" @click="logout">
      <span  class="login-btn-font">ログアウト</span>
    </button>
    <NuxtLink v-else="currentUser" class="login-btn" to="/login">
      <span  class="login-btn-font">ログイン</span>
    </NuxtLink>
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
