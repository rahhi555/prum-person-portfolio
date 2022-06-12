<script lang="ts" setup>
const isLoggedin = ref(false)
const loginBtnText = computed(() => isLoggedin.value ? "ログアウト" : "ログイン")
</script>

<template>
  <div class="header">
    <p class="header-title">My Portfolio</p>
    <button class="login-btn">
      <span class="login-btn-font" v-text="loginBtnText"></span>
    </button>
  </div>  
</template>

<style scoped>
.header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0px 40px;
  gap: 10px;

  position: absolute;
  width: 1440px;
  height: 120px;
  left: 0px;
  top: 0px;

  background-color: var(--primary-color);
}

.header-title {
width: 201px;
height: 42px;

font-style: normal;
font-weight: 700;
font-size: 36px;
line-height: 42px;

color: #FFFFFF;

flex: none;
order: 0;
flex-grow: 0;
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

  flex: none;
  order: 1;
  flex-grow: 0;
}

.login-btn-font {
  width: 72px;
height: 21px;

font-family: 'Roboto';
font-style: normal;
font-weight: 400;
font-size: 18px;
line-height: 21px;

color: rgba(0, 0, 0, 0.75);

flex: none;
order: 0;
flex-grow: 0;
}
</style>
