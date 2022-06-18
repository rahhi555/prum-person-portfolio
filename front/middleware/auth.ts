import { useCurrentUser } from '~/composables/useCurrentUser'

export default defineNuxtRouteMiddleware(() => {
  const { currentUser } = useCurrentUser()

  if (!currentUser.value) {
    return navigateTo('/login')
  }
})