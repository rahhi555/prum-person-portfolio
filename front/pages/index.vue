<script setup lang="ts">
import type { TChartData } from "vue-chartjs/dist/types";

const { currentUser } = useCurrentUser();
const { data, pending } = useAsyncData("skills", () => GqlCategories(), { initialCache: false });

const datasets = computed(() => {
  return data.value?.categories?.flatMap((category, categoryIndex) => {
    return category.skills?.map((skill) => {
      const data: (null | number)[] = [null, null, null];
      data[categoryIndex] = skill.level;
      return {
        label: skill.name,
        data,
        backgroundColor: `rgba(
          ${Math.floor(Math.random() * 255)}, 
          ${Math.floor(Math.random() * 255)}, 
          ${Math.floor(Math.random() * 255)}, 
          0.5)`,
      };
    });
  });
});

const chartData = ref<TChartData<"bar">>({
  labels: data.value?.categories?.map((category) => category.name),
  // @ts-ignore
  datasets,
});
</script>

<template>
  <div class="wrapper">
    <div class="profile-wrapper">
      <img class="avater" :src="currentUser?.avatar || ''" />
      <div class="profile-body">
        <h1>自己紹介</h1>
        <p class="profile-text">
          {{ currentUser ? currentUser.profile : "ログインして、自己紹介文と画像を登録しましょう！" }}
        </p>
        <NuxtLink v-if="currentUser" :to="`/users/${currentUser.id}/edit`">
          <AtomsButton :color="'primary'" :text="'自己紹介を編集する'" :size="'large'" />
        </NuxtLink>
      </div>
    </div>

    <div class="skill-wrapper" v-if="currentUser">
      <h1>スキルチャート</h1>
      <NuxtLink :to="`/users/${currentUser.id}/skills/edit`">
        <AtomsButton :color="'primary'" :text="'スキルを編集する'" :size="'large'" />
      </NuxtLink>
      <AtomsChartBar v-if="!pending" :chart-data="chartData" style="margin-top: 100px;" />
    </div>
  </div>
</template>

<style scoped>
.wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 3rem 0;
}

.wrapper > .profile-wrapper {
  display: flex;
  width: min(60%, 960px);
  flex-wrap: wrap;
}

.wrapper > .profile-wrapper > .avater {
  width: min(360px, 100%);
  height: 360px;
  background-color: #c4c4c4;
  clip-path: circle(40% at center);
}

.wrapper > .profile-wrapper > .profile-body {
  display: flex;
  flex-direction: column;
  margin-left: 3rem;
  width: min(360px, 100%);
}

.wrapper > .profile-wrapper > .profile-body > h1 {
  font-weight: 700;
  font-size: 36px;
  border-bottom: 1px solid black;
}

.wrapper > .profile-wrapper > .profile-body > .profile-text {
  color: v-bind('currentUser ? "black" : "red"');
  margin: 1rem 0;
}

.wrapper > .skill-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  margin-top: 30px;
}

.wrapper > .skill-wrapper > h1 {
  font-weight: 700;
  font-size: 36px;
  margin: 3rem 0;
  border-bottom: 1px solid black;
}
</style>
