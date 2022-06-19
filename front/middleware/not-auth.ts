/**
 * ログアウト必須
 */

import { useCurrentUser } from '~/composables/useCurrentUser'

export default defineNuxtRouteMiddleware(() => {
  // ログインユーザー取得処理より早く発生してしまうため,SSR時はリターン
  if (process.server) return

  const { currentUser } = useCurrentUser()
  
  if (currentUser.value != null) {
    return navigateTo('/')
  }
})