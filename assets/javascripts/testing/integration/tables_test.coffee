# menu = $('#menu li a');
# tables = $('#tables a');
# tableNumber = $('div.nine h2 span').text();
# total = $('#total h3 span').text();
# addFoodText = $('#customer-tab li h3')[0].firstChild

pavlov.specify "Ordr App integration tests", () ->
  describe "Tables", () ->

    before () ->
      Ember.run(App, App.advanceReadiness)

    after () ->
      App.reset()

    describe "Initial state", () ->
      it "should redirect to '/tables'", async () ->
        visit('/').then () ->
          assert(testing(App).path()).equals('tables.index')
          resume()

      it "should display six tables", async () ->
        visit('/tables').then () ->
          assert(find('.tableMenu a').length).equals(6)
          resume()

    describe "Table 2", () ->
      it "should display food menu with 5 choices and placeholder text", async () ->
        expect(3)
        visit('/tables/2').then () ->
          assert(find('.tab h2 span').text()).equals("2")
          assert(find('.tab li h3:first').text()).equals('Click a food to add it')
          assert(find('.menu li > a').length).equals(5)
          resume()