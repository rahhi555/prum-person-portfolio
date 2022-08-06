<script setup lang="ts">
definePageMeta({
  middleware: 'auth'
})

const { data } = await useAsyncData('categories', () => GqlCategories(), { initialCache: false })
</script>

<template>
  <div class="edit-wrapper">
    <OrganismsSkillCard
      v-for="category in data.categories"
      :key="category.id"
      :category="category"
      class="card"
    />
  </div>
</template>

<style scoped>
.edit-wrapper {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin: 80px auto;
}

.edit-wrapper > .card:not(:last-child) {
  margin-bottom: 20px;
}
</style>
