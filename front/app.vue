<script setup lang="ts">
// リロード時のログイン処理
onServerPrefetch(async () => {
  const { ssrUserInit } = useCurrentUser()
  await ssrUserInit()
})

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