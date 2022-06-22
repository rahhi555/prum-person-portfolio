<script setup lang="ts">
// SSR時にuseGqlTokenを使用してもCSRには引き継がれないようなので、CSRで再度設定
onMounted(() => {
  const { jwt } = useCurrentUser()
  if (jwt.value != null) {
    useGqlToken(jwt.value)
  }
})
</script>

<template>
  <CommonAlert />
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>

<style>
@import url("~/assets/destyle.css");
@import url("~/assets/common.css");
</style>