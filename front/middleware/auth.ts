/**
 * ログイン認証ミドルウェア　及び　ユーザー認証ミドルウェア
 */

import { useCurrentUser } from '~/composables/useCurrentUser'

export default defineNuxtRouteMiddleware((to) => {
  const { currentUser } = useCurrentUser()

  // ログインユーザーが存在しない場合はログインページへ遷移
  if (currentUser.value == null) {
    return navigateTo('/login')
  }

  // params.idが存在し、かつ、params.idとログインユーザーIDが一致しない場合はトップページへ遷移
  if (to.params.id && to.params.id !== currentUser.value.id) {
    return navigateTo('/')
  }
})