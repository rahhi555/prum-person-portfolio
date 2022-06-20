<script setup lang="ts">
import type { UpdateUserMutation } from "#build/gql-sdk";
import { gqlErrorHandling } from "~/graphql";

definePageMeta({
  middleware: "auth",
});

const { updateCurrentUser, currentUser } = useCurrentUser();

const newProfile = ref(currentUser.value?.profile || "");

const { uploadFile, preview_url, setAvatar } = useFileUpload()

const updateUser = async () => {
  try {
    await uploadFile("user")
    const { updateUser } = (await GqlUpdateUser({ profile: newProfile.value })) as UpdateUserMutation;
    
    if (updateUser == null) throw new Error();

    await updateCurrentUser(updateUser.user);
  } catch (e) {
    gqlErrorHandling(e);
  }
};
</script>

<template>
  <div class="edit-profile-wrapper">
    <h1>自己紹介を編集する</h1>
    <form class="edit-profile-form">
      <label for="edit-profile">自己紹介文</label>
      <textarea id="edit-profile" v-model="newProfile"></textarea>

      <label for="edit-avatar">アバター画像</label>
      <input id="edit-avatar" type="file" accept="image/png,image/jpeg" @change="setAvatar" />
      <img :src="preview_url" />
      <CommonButton color="primary" text="自己紹介を確定する" @click.prevent="updateUser"></CommonButton>
    </form>
  </div>
</template>

<style scoped>
.edit-profile-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 3rem;
}

.edit-profile-form {
  display: flex;
  flex-direction: column;
}

#edit-profile {
  border-bottom: 1px solid black;
}
</style>
