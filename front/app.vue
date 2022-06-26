<script setup lang="ts">
// if (process.env.NODE_ENV === 'development') {
//   import('./mocks/browser').then(module => {
//     module.worker.start()
//   })
// }

// SSR時にuseGqlTokenを使用してもCSRには引き継がれないようなので、CSRで再度設定
onMounted(() => {
  const { jwt } = useCurrentUser()
  if (jwt.value != null) {
    useGqlToken(jwt.value)
  }
})
</script>

<template>
  <OrganismsAlert/>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>

<style>
@import url("~/assets/destyle.css");
@import url("~/assets/common.css");
</style>