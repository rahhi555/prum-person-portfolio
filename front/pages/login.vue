<script setup lang="ts"></script>

<template> 
  <div class="login-wrapper">
    <h1 class="login-h1">ログイン</h1>
    <form class="login-form">
      <CommonInput :id="'email'" :type="'email'" :label="'メールアドレス'" />
      <CommonInput :id="'password'" :type="'password'" :label="'パスワード'" />
      <CommonButton :color="'primary'" :text="'ログインする'" /> 
    </form>
  </div>
</template>

<style scoped>
.login-wrapper {
  display: flex;
  align-items: center;
  flex-direction: column;
  margin-top: 5rem;
}

.login-h1 {
  font-size: 36px;
  color: rgba(0, 0, 0, 0.75);
  margin-bottom: 5rem;
}

.login-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0px;
  gap: 48px;

  width: 480px;
  height: 245px;
}
</style>