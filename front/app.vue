<script setup lang="ts">
onServerPrefetch(async () => {
  const { ssrUserInit } = useCurrentUser()
  await ssrUserInit()
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