<template>
  <div class="default-wrapper">
    <LayoutsDefaultTheHeader />
    <main class="default-container">
      <slot />
    </main>
    <LayoutsDefaultTheFooter />
  </div>
</template>

<style scoped>
.default-wrapper {
  display: grid;
  grid-template-rows: auto 1fr auto;
  height: 100vh;
  background-color: #fff;
}

.default-container {
  margin: 0 3%;
}
</style>
