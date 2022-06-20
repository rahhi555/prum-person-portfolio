describe('empty spec', () => {
  it('ログイン処理', () => {
    cy.visit("/")
    cy.get('.profile-text').contains("ログインして、自己紹介文と画像を登録しましょう！")
    cy.get('.login-btn').click()
    cy.url().should('include', '/login')
    // 何故かクリック前に500msほど待機しないとメソッドが発火しない
    cy.wait(500)
    cy.get('.common-btn').click()
    cy.get('.alert').contains("ログインに失敗しました")
    cy.get('#email').type('test1@example.com')
    cy.get('#password').type('password')
    cy.get('.common-btn').click()
    cy.get('.alert').contains("ログインしました")
    cy.url().should('match', /users\/\d+\/edit/)
  })
})