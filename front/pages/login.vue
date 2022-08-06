<script setup lang="ts">
definePageMeta({
  middleware: 'not-auth'
})

const user = reactive({
  email: '',
  password: ''
})

const { login } = useCurrentUser()
</script>

<template>
  <div class="login-wrapper">
    <h1 class="login-h1">
      ログイン
    </h1>
    <form class="login-form">
      <AtomsInput :id="'email'" v-model="user.email" :type="'email'" :label="'メールアドレス'" />
      <AtomsInput :id="'password'" v-model="user.password" :type="'password'" :label="'パスワード'" />
      <AtomsButton :color="'primary'" :type="'submit'" :text="'ログインする'" @click.prevent="login(user)" />
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

  width: min(80%, 480px);
  height: 245px;
}
</style>
