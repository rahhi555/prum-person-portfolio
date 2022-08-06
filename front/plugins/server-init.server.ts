import { useCurrentUser } from '~/composables/useCurrentUser'

/**
 * SSR時にリクエストヘッダーからjwtを取り出し、現在のユーザーをフェッチする
 */
export default defineNuxtPlugin(async (_) => {
  const { ssrUserInit } = useCurrentUser()
  await ssrUserInit()
})
