<script setup lang="ts">
type colors = 'primary' | 'secondary'
defineProps<{ color: colors, text: string }>()
</script>

<template>
  <button class="common-btn" :class="color">
    <span class="common-btn-text">{{text}}</span>
  </button>
</template>

<style scoped>
.common-btn {
  padding: 16px 80px;
  width: min(100%, 322px);
  height: 53px;
  text-align: center;
  border-radius: 4px;
}

.common-btn-text {
  color: white;
  font-size: 18px;
}

.primary {
  background-color: var(--primary-color);
}

.secondary {
  background-color: var(--secondary-color);
}
</style>