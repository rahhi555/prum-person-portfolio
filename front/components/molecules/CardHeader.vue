<script setup lang="ts">
import AtomsButton from '../atoms/Button.vue'
import type { Props as BtnProps } from '../atoms/Button.vue'
export interface Props {
  title: string, buttonColor: BtnProps['color'], buttonText: string
}

defineProps<Props>()

const emit = defineEmits<{(e: 'buttonClick'): void}>()
const buttonClick = () => {
  emit('buttonClick')
}
</script>

<template>
  <div class="card-header">
    <h3 class="card-title">
      {{ title }}
    </h3>
    <AtomsButton
      :color="buttonColor"
      :text="buttonText"
      :size="'medium'"
      @click="buttonClick"
    />
  </div>
</template>

<style scoped>

.card-header {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.card-header > .card-title {
  width: min(100%, 240px);
  line-height: 50px;
  font-weight: 700;
  font-size: 24px;
  border-bottom: 2px solid rgba(0, 0, 0, 0.5);
}
</style>
