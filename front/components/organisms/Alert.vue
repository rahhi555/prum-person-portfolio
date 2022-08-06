<script setup lang="ts">
const { alertStatus } = useAlert()

const { color, message, visible } = toRefs(alertStatus.value)
</script>

<template>
  <div class="alert">
    <p>{{ message }}</p>
  </div>
</template>

<style scoped>
.alert {
  position: fixed;
  top: 4rem;
  left: 50%;
  transform: translateX(-50%);
  border-radius: 5px;
  box-sizing: border-box;
  color: white;
  font-size: 1.5em;
  padding: 1em;
  background-color: v-bind(color);
  visibility: v-bind(visible);
}
</style>
