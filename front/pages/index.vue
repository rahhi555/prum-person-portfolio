<script setup lang="ts">
const { currentUser } = useCurrentUser();
</script>

<template>
  <div class="profile-wrapper">
    <img class="avater" :src="currentUser?.avatar || ''">
    <div class="profile">
      <h1>自己紹介</h1>
      <p class="profile-text">{{ currentUser ? currentUser.profile : "ログインして、自己紹介文と画像を登録しましょう！" }}</p>
      <CommonButton
        v-if="currentUser"
        :color="'primary'"
        :text="'自己紹介を編集する'"
        @click="navigateTo(`/users/${currentUser?.id}/edit`)"
      >
      </CommonButton>
    </div>
  </div>
</template>

<style scoped>
.profile-wrapper {
  display: flex;
  justify-content: center;
  padding: 0px;
  gap: 80px;
  height: 360px;
  margin-top: 3rem;
}

.avater {
  width: 360px;
  height: 360px;
  background-color: #c4c4c4;
  clip-path: circle(50% at center);
}

.profile {
  display: flex;
  flex-direction: column;
}

.profile-text {
  color: v-bind('currentUser ? "black" : "red"')
}
</style>
