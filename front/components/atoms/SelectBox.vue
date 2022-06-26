<script setup lang="ts">
export interface Props {
  options: number[] | string[];
  selectedIndex?: number;
}
defineProps<Props>();
</script>

<template>
  <div class="select-wrap">
    <select class="select-base">
      <option v-for="(option, i) in options" :value="option" :selected="selectedIndex === i + 1">
        {{ option }}
      </option>
    </select>
  </div>
</template>

<style scoped>
.select-wrap {
  --dark-color: rgba(0, 0, 0, 0.54);
}

.select-wrap {
  position: relative;
  width: min(100%, 160px);
}

.select-wrap:after {
  content: "";
  position: absolute;
  right: 20px;
  top: 15px;
  width: 10px;
  height: 10px;
  border-top: 8px solid var(--dark-color);
  border-left: 8px solid transparent;
  border-right: 8px solid transparent;
  pointer-events: none;
}

.select-base {
  width: min(100%, 160px);
  height: 40px;
  border: 1px solid rgba(0, 0, 0, 0.23);
  border-radius: 4px;
  padding: 10px;
  color: var(--dark-color);
}
</style>
