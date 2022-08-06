<script setup lang="ts">
import CardHeader from '../molecules/CardHeader.vue'
import CardRow from '../molecules/CardRow.vue'
import SelectBox from '../atoms/SelectBox.vue'
import AtomsButton from '../atoms/Button.vue'
import { Category, gqlErrorHandling } from '~/graphql'
export interface NavigateQuery {
  categoryId: string;
  categoryName: string;
}

const { currentUser } = useCurrentUser()

const { category } = defineProps<{ category: Category }>()

const navigateNewSkill = () => {
  navigateTo({
    path: `/users/${currentUser.value?.id}/skills/new`,
    query: {
      categoryId: category.id,
      categoryName: category.name
    }
  })
}

const updateSkill = async ({ id, level }: { id: string, level: number }) => {
  await GqlUpdateSkill({ id, level }).catch(gqlErrorHandling)
  const { showAlert } = useAlert()
  showAlert({
    message: 'スキルを更新しました',
    color: 'var(--success-color)'
  })
}

const deleteSkill = async (id: string) => {
  await GqlDeleteSkill({ id }).catch(gqlErrorHandling)
  const index = category.skills!.findIndex(skill => skill.id === id)
  category.skills!.splice(index, 1)
  const { showAlert } = useAlert()
  showAlert({
    message: 'スキルを削除しました',
    color: 'var(--success-color)'
  })
}
</script>

<template>
  <div class="card-wrapper">
    <CardHeader
      :title="category.name"
      :button-color="'primary'"
      :button-text="'スキルを追加する'"
      @button-click="navigateNewSkill"
    />

    <div class="card-body">
      <CardRow :size="'medium'">
        <template #header1>
          習得スキル
        </template>
        <template #header2>
          習得レベル
        </template>
        <template #header3 />
        <template #header4 />
      </CardRow>

      <CardRow v-for="skill in category.skills">
        <template #skill-name>
          {{ skill.name }}
        </template>

        <template #select-box>
          <SelectBox
            v-model="skill.level"
            :options="Array.from({ length: 101 }, (_, i) => i)"
          />
        </template>

        <template #primary-button>
          <AtomsButton
            :text="'習得レベルを保存する'"
            :color="'primary'"
            :outline="true"
            :size="'small'"
            @click="updateSkill({ id: skill.id, level: skill.level })"
          />
        </template>

        <template #secondary-button>
          <AtomsButton
            :text="'スキルを削除する'"
            :color="'secondary'"
            :size="'small'"
            @click="deleteSkill(skill.id)"
          />
        </template>
      </CardRow>
    </div>
  </div>
</template>

<style scoped>
.card-wrapper {
  display: flex;
  flex-direction: column;
  border: 1px solid black;
  border-radius: 5px;
  width: min(100%, 960px);
  height: max(430px, auto);
  padding: 30px;
}

.card-wrapper > .card-body {
  margin-top: 38px;
  box-shadow: 0px 3px 1px -2px rgba(0, 0, 0, 0.2), 0px 2px 2px rgba(0, 0, 0, 0.14), 0px 1px 5px rgba(0, 0, 0, 0.12);
}
</style>
