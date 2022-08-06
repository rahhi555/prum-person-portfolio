import { graphql } from 'msw'
import type { LoginMutation, LoginMutationVariables, CurrentUserQuery } from '#build/gql-sdk'

const user = {
  id: '1',
  email: 'test1@example.com',
  profile: 'プロフィール初期値',
  password: 'password'
}

export const handlers = [
  graphql.mutation<LoginMutation, LoginMutationVariables>('login', (req, res, ctx) => {
    console.log('login')
    const { email, password } = req.variables

    if (user.email === email && user.password == password) {
      return res(
        ctx.data({
          login: {
            jwt: user.id,
            user: {
              id: user.id,
              email: user.email,
              profile: user.profile
            }
          }
        })
      )
    } else {
      return res(
        ctx.errors([
          { message: 'ログインに失敗しました' }
        ])
      )
    }
  }),

  graphql.query<CurrentUserQuery>('currentUser', (req, res, ctx) => {
    console.log('currentUser')
    return res(
      ctx.data({
        currentUser: {
          id: user.id,
          email: user.email,
          profile: user.profile
        }
      })
    )
  })
]
