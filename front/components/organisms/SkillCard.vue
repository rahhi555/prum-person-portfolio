<script setup lang="ts">
import type { Category } from "~/graphql";
import CardHeader from "../molecules/CardHeader.vue";
import CardRow from "../molecules/CardRow.vue";
import SelectBox from "../atoms/SelectBox.vue";
import AtomsButton from "../atoms/Button.vue";
export interface NavigateQuery {
  categoryId: string;
  categoryName: string;
}

const { currentUser } = useCurrentUser()

const { category } = defineProps<{ category: Category }>();

const navigateNewSkill = () => {
  navigateTo({
    path: `/users/${currentUser.value?.id}/skills/new`,
    query: {
      categoryId: category.id,
      categoryName: category.name
    }
  });
}
</script>

<template>
  <div class="card-wrapper">
    <CardHeader
      :title="category.name"
      :buttonColor="'primary'"
      :buttonText="'スキルを追加する'"
      @button-click="navigateNewSkill"
    ></CardHeader>

    <div class="card-body">
      <CardRow :size="'medium'">
        <template #header1>習得スキル</template>
        <template #header2>習得レベル</template>
        <template #header3></template>
        <template #header4></template>
      </CardRow>

      <CardRow v-for="skill in category.skills">
        <template #skill-name>
          {{ skill.name }}
        </template>

        <template #select-box>
          <SelectBox
            :options="Array.from({ length: 100 }, (_, i) => i + 1)"
            :selected-index="skill.level" />
        </template>

        <template #primary-button>
          <AtomsButton
            :text="'習得レベルを保存する'" 
            :color="'primary'" 
            :outline="true"
            :size="'small'"
             />
        </template>

        <template #secondary-button>
          <AtomsButton 
            :text="'スキルを削除する'" 
            :color="'secondary'"
            :size="'small'" />
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
