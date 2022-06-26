<script setup lang="ts">
import { useSlots, computed } from "vue";
export interface Props {
  size?: "medium" | "large";
}

const { size } = withDefaults(defineProps<Props>(), {
  size: "large"
})

const slotKeys = Object.keys(useSlots())

const height = computed(() => {
  switch (size) {
    case "medium":
      return "57px"
    case "large":
      return "72px"
  }
})
</script>

<template>
  <div class="row">
    <template v-for="key in slotKeys">
      <div class="item">
        <slot :name="key"></slot>
      </div>
    </template> 
  </div>
</template>

<style scoped>
.row {
  --row-width: 880px;
}

.row {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  width: min(100%, var(--row-width));
  height: min(100%, v-bind(height));
  border-bottom: 1px solid #e0e0e0;
  flex-wrap: wrap;
}

.row > .item {
  width: calc(var(--row-width) / v-bind('slotKeys.length'));
  padding: 10px;
}
</style>
