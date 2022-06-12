<script setup lang="ts">
defineProps<{ id: string, type: string, label: string }>()
</script>

<template>
  <div class="input-form">
    <label :for="id">{{label}}</label>
    <input :id="id" :type="type" />
  </div>
</template>

<style scoped>
.input-form {
  display: flex;
  width: min(100%, 480px);
  height: 48px;
  flex-direction: column;
  justify-content: space-between;
}

.input-form > label {
  font-size: 12px;
  line-height: 12px;
  letter-spacing: 0.15px;
  color: rgba(0, 0, 0, 0.54);
}

.input-form > input {
  border-bottom: solid 1px;
}
</style>