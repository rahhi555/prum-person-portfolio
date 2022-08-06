<script setup lang="ts">
import { computed } from 'vue'

export interface Props {
  options: number[] | string[];
  modelValue: number;
}
const props = defineProps<Props>()

const emit = defineEmits<{(e: 'update:modelValue', value: number): void}>()

const vModelValue = computed({
  get: () => props.modelValue,
  set: value => emit('update:modelValue', value)
})

console.log('fuga')

console.log('3')
</script>

<template>
  <div class="select-wrap">
    <select v-model="vModelValue" class="select-base">
      <option
        v-for="option in options"
        :key="option"
        :value="option"
      >
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
