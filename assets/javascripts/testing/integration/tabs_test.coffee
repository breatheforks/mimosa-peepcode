module "tabs",
  setup: ->
    Ember.run ->
      App.reset()

test "Adding a pizza to table 1 should result in a change to tab1 but not to tab3", () ->
  expect(5)
  visit('/tables/1')
  andThen () ->
     equal("1", find('.tab h2 span').text(), "navigating to table 1 should show table1 id in table selection pane")

  click('.menu a:eq(0)')
  andThen () ->
    equal('Pizza$15.00', find('.tab li:eq(0) > h3').text(), "Clicking pizza item should add pizza to tab")
    equal('$15.00', find('.total span').text(), "Total price should reflect pizza addition")

  visit('/tables/3')
  andThen () ->
    equal('3', find('.tab h2 span').text(), "navigating to table 3 should show table3 id in table selection pane")

  visit('/tables/1')
  andThen () ->
    equal('Pizza$15.00', find('.tab li:eq(0) > h3').text(), "navigating back to table1 should show total for tab1")

test 'Table 4 should already have $54.50 in foods in its startup tab', () ->
  expect(2)
  visit('/tables/4')
  andThen () ->
    actual = []
    expectedFoods = 'Pizza$15.00Pancakes$3.00Fries$7.00HotDog$9.50BirthdayCake$20.00Total$54.50'
    actual = find('.tab li').text()
    equal(expectedFoods, actual.replace(/\s/g, ''), "Should see an initial tab for table 4")
    equal('$54.50', find('.total span').text(), "Should see total for the default items in table 4's tab")