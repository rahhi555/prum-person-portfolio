import { before } from 'cypress/types/lodash'

const user = {
  id: '3',
  email: 'test1@example.com',
  password: 'password',
  jwt: 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozfQ.jzKOZWCIlXZFg9yns_fRexwYQN5A9BTD9XBC-R4W6SE'
}

describe('empty spec', () => {
  it('ログイン処理', () => {
    cy.visit('/')
    cy.get('.profile-text').contains('ログインして、自己紹介文と画像を登録しましょう！')
    cy.get('.login-btn').click()
    cy.url().should('include', '/login')
    // ログインしていない状態でユーザーページにアクセスすると、ログインページに遷移する
    cy.visit('/users/1/edit')
    cy.url().should('include', '/login')
    // 何故かクリック前に500msほど待機しないとメソッドが発火しない
    cy.wait(500)
    cy.get('.common-btn').click()
    cy.get('.alert').contains('ログインに失敗しました')
    cy.get('#email').type(user.email)
    cy.get('#password').type(user.password)
    cy.get('.common-btn').click()
    cy.get('.alert').contains('ログインしました')
    cy.url().should('eq', 'http://localhost/')
    // ログインページにアクセスすると、トップページに遷移する
    cy.visit('/login')
    cy.url().should('eq', 'http://localhost/')
  })

  it('プロフィール更新', () => {
    cy.setCookie('prum_person_portfolio_jwt', user.jwt)
    cy.visit('/')
    cy.wait(500)
    cy.get('.profile-body > a > .common-btn').click()
    const newProfile = Math.random().toString(32).substring(2)
    cy.get('#edit-profile').clear().type(newProfile, { })
    cy.get('.common-btn').click()
    cy.get('.alert').contains('ユーザー情報を更新しました')
    cy.get('.header-title').click()
    cy.get('.profile-text').contains(newProfile)
  })

  it('自分以外のページにアクセスすると、トップページに遷移する', () => {
    cy.setCookie('prum_person_portfolio_jwt', user.jwt)
    cy.visit('/users/2/edit')
    cy.url().should('include', '/')
  })
})
