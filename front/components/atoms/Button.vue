<script setup lang="ts">
import { computed } from 'vue'

export interface Props {
  color: 'primary' | 'secondary';
  text: string;
  outline?: boolean;
  size: 'small' | 'medium' | 'large';
}

const { color, size, outline } = withDefaults(defineProps<Props>(), {
  outline: false,
  size: 'large'
})

const themeColor = computed(() => `var(--${color}-color)`)

const sizeObj = computed(() => {
  switch (size) {
    case 'small':
      return {
        height: '32px',
        fontSize: '14px'
      }
    case 'medium':
      return {
        height: '48px',
        fontSize: '16px'
      }
    case 'large':
      return {
        height: '53px',
        fontSize: '18px'
      }
  }
})

const commonBtnStyles = computed(() => {
  return {
    height: sizeObj.value.height,
    backgroundColor: outline ? 'white' : themeColor.value,
    border: outline ? `1px solid ${themeColor.value}` : 'none'
  }
})

const commonBtnTextStyles = computed(() => {
  return {
    color: outline ? themeColor.value : 'white',
    fontSize: sizeObj.value.fontSize
  }
})
</script>

<template>
  <button class="common-btn" :style="commonBtnStyles">
    <span class="common-btn-text" :style="commonBtnTextStyles">{{ text }}</span>
  </button>
</template>

<style scoped>
.common-btn {
  width: min(100%, 322px);
  text-align: center;
  border-radius: 4px;
  padding: 8px 16px;

  /*
    現時点ではcss v-bindにcomputedを使用すると、ssr時にバグる
    https://github.com/nuxt/framework/issues/5546
   */
  /* height: v-bind('sizeObj.height'); */
  /* background-color: v-bind('outline ? "white" : themeColor'); */
  /* border: 1px solid v-bind('outline ? themeColor : "transparent"'); */
}

/* .common-btn-text {
  color: v-bind('outline ? themeColor : "white"');
  font-size: v-bind('sizeObj.fontSize');
} */
</style>
