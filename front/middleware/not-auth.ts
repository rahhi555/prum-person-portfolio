/**
 * ログアウト必須
 */

import { useCurrentUser } from '~/composables/useCurrentUser'

export default defineNuxtRouteMiddleware(() => {
  const { currentUser } = useCurrentUser()

  if (currentUser.value != null) {
    return navigateTo('/')
  }
})
