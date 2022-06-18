<script setup lang="ts">
const { alertStatus } = useAlert()

const { color, message, visible } = toRefs(alertStatus.value)
</script>

<template>
  <div class="alert">
    <p>{{message}}</p>
  </div>
</template>

<style scoped>
.alert {
  position: fixed;
  border-radius: 5px;
  box-sizing: border-box;
  color: white;
  font-size: 1.5em;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em;
  width: calc(100% - 100px);
  background-color: v-bind(color);
  visibility: v-bind(visible);
}
</style>