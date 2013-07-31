pavlov.specify("Ordr App integration tests", () ->

  describe "Login", () ->

    before () ->
      Ember.run(App, App.advanceReadiness)

    after () ->
      App.reset()

    describe "Initial state", () ->

      it "should not be logged in", async () ->
        visit('/').then () ->
          assert(testing(App).path()).equals('tables.index')
          resume()
)
