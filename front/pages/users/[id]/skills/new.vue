<script setup lang="ts">
import type { NavigateQuery } from "~/components/organisms/SkillCard.vue";
import { gqlErrorHandling } from "~/graphql";

definePageMeta({
  middleware: "auth"
});

const route = useRoute();
const { categoryId, categoryName } = <unknown>route.query as NavigateQuery;

const newSkill = reactive({
  categoryId,
  name: "",
  level: 0,
})


const createSkill = async () => {
  const { showAlert } = useAlert()

  if (newSkill.name === "") {
    showAlert({ message: "スキル名を入力してください", color: "var(--danger-color)" })
    return
  }

  if (newSkill.level < 0 || newSkill.level > 100) {
    showAlert({ message: "スキルレベルは0から100までの値を入力してください", color: "var(--danger-color)" })
    return
  }

  try {
    await GqlCreateSkill({...newSkill})
  } catch(e) {
    gqlErrorHandling(e)
  }

  const { currentUser } = useCurrentUser()

  navigateTo({
    path: `/users/${currentUser.value?.id}/skills/edit`
  })
  showAlert({ message: "スキルを追加しました", color: "var(--success-color)" })
}
</script>

<template>
  <div class="new-skill">
    <h1>{{ categoryName }}にスキルを追加</h1>
    <AtomsInput 
      :id="'new-skill-name'"
      :label="'習得スキル名'"
      :type="'text'"
      required
      v-model="newSkill.name"
      class="input-item"
    />
    <AtomsInput 
      :id="'new-skill-lebel'"
      :label="'習得レベル'"
      :type="'number'"
      v-model="newSkill.level"
      min="0"
      max="100"
      required
      class="input-item"
    />
    <AtomsButton 
      :color="'primary'"
      :text="'追加する'"
      @click="createSkill"
    />
  </div>
</template>

<style scoped>
.new-skill {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 80px;
}

.new-skill > h1 {
  font-size: 36px;
  margin-bottom: 80px;
}

.new-skill > .input-item {
  margin-bottom: 50px;
}
</style>