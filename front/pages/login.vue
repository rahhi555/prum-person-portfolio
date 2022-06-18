<script setup lang="ts">
const user = reactive({
  email: "",
  password: ""
})

const { login, currentUser } = useCurrentUser()
</script>

<template> 
  <div class="login-wrapper">
    <h1 class="login-h1">ログイン</h1>
    <form class="login-form">
      <CommonInput :id="'email'" :type="'email'" :label="'メールアドレス'" v-model="user.email"/>
      <CommonInput :id="'password'" :type="'password'" :label="'パスワード'" v-model="user.password" />
      <CommonButton :color="'primary'" :type="'submit'" :text="'ログインする'" @click.prevent="login(user)" /> 
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