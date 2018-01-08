describe('a-spec', () => {
  describe('page', () => {
    beforeEach(() => {
      cy.visit(Cypress.env('HOST') || 'index.html')
    })

    it('has h2', () => {
      cy.contains('h2', 'test')
    })

    it('echoes', () => {
      cy.exec('echo Jane Lane')
        .its('stdout').should('contain', 'Jane Lane')
    })
  })
})
