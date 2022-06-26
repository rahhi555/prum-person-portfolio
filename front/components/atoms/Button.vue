<script setup lang="ts">
import { computed } from 'vue';

export interface Props {
  color: "primary" | "secondary";
  text: string;
  outline?: boolean;
  size: "small" | "medium" | "large";
}

const { color, size } = withDefaults(defineProps<Props>(), {
  outline: false,
  size: "large"
});

const themeColor = computed(() => `var(--${color}-color)`)

const sizeObj = computed(() => {
  switch (size) {
    case "small":
      return { 
        height: "32px",
        fontSize: "14px"
      };
    case "medium":
      return { 
        height: "48px",
        fontSize: "16px"
      };
    case "large":
      return { 
        height: "53px",
        fontSize: "18px"
      };
  }
})
</script>

<template>
  <button class="common-btn">
    <span class="common-btn-text">{{text}}</span>
  </button>
</template>

<style scoped>
.common-btn {
  width: min(100%, 322px);
  height: v-bind('sizeObj.height');
  text-align: center;
  border-radius: 4px;
  background-color: v-bind('outline ? "white" : themeColor');
  border: 1px solid v-bind('outline ? themeColor : "transparent"');
  padding: 8px 16px;
}

.common-btn-text {
  color: v-bind('outline ? themeColor : "white"');
  font-size: v-bind('sizeObj.fontSize');
}
</style>