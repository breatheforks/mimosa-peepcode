pavlov.specify "Ordr App integration tests", () ->

  describe "Tabs", () ->

    before () ->
      Ember.run(App, App.advanceReadiness)

    after () ->
      App.reset()

    describe "Tables 1 and 3", () ->

      it "should add and keep a $15 pizza in the tab for table 1", async () ->
        expect(5)
        visit('/tables/1')
          .then () ->
            assert(find('.tab h2 span').text()).equals('1')
            return click('.menu li:eq(0) > a')
          .then () ->
            assert(find('.tab li:eq(0) > h3' ).text() ).equals( 'Pizza$15.00' )
            assert(find('.total span').text() ).equals( '$15.00' )
            visit('/tables/3')
              .then () ->
                assert(find('.tab h2 span').text()).equals('3')
                visit('/tables/1')
                  .then () ->
                    assert( find('.tab li:eq(0) > h3').text() ).equals( 'Pizza$15.00' )
                    resume()

    describe "Table 4", () ->

      it "should already have $54.50 in foods in tab", async () ->
        expect(2)
        visit('/tables/4').then () ->
          actual = []
          expectedFoods = 'Pizza$15.00Pancakes$3.00Fries$7.00HotDog$9.50BirthdayCake$20.00Total$54.50'

          actual = find('.tab li').text()
          assert( actual.replace(/\s/g, '') ).equals( expectedFoods )
          assert( find('.total span').text() ).equals( '$54.50' )
          resume()
