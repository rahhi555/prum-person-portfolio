type FileUploadTarget = 'user'

export const useFileUpload = () => {
  /**
   * 画像バイナリデータ
   */
  const newAvatar = ref<File>();

  /**
   * 画像プレビューurl
   */
  const preview_url = ref("");

  /**
   * 画像及びプレビューurlセット
   */
  const setAvatar = (e: Event) => {
    const files = (e.target as HTMLInputElement).files;
    if (files?.length) {
      newAvatar.value = files[0];
      preview_url.value = URL.createObjectURL(newAvatar.value);
    } else {
      newAvatar.value = undefined;
      preview_url.value = "";
    }
  };

  /**
   * ファイルアップロード
   */
  const uploadFile = async (upload: FileUploadTarget) => {
    if(!newAvatar.value) return

    const { jwt } = useCurrentUser();

    const formData = new FormData()

    formData.append("avatar", newAvatar.value)

    const res = await $fetch<{ id: string; avatar: string }>(upload, {
      baseURL: useRuntimeConfig().public.FILE_UPLOAD_HOST,
      method: "POST",
      body: formData,
      headers: { 
        Authorization: `Bearer ${jwt.value}`, 
        ContentType: 'multipart/form-data'
      }
    });

    return res.avatar
  };

  return {
    newAvatar,
    preview_url,
    setAvatar,
    uploadFile
  };
};
