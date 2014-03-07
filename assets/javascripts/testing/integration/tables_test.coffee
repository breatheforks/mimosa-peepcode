# menu = $('#menu li a');
# tables = $('#tables a');
# tableNumber = $('div.nine h2 span').text();
# total = $('#total h3 span').text();
# addFoodText = $('#customer-tab li h3')[0].firstChild

module "tables",
  setup: ->
    Ember.run ->
      App.reset()
      App.use_fixture_adapter()

test "Initial state should redirect to /tables", () ->
  expect(1)
  visit('/')
  andThen () ->
    equal('tables.index', currentRouteName())

test "Initial state should display six tables", () ->
  expect(1)
  visit('/tables')
  andThen () ->
    numTables = find('.tableMenu a').length
    equal(6, numTables, 'Should be six tables in the initial app state')

test "Clicking table 4 should show food menu with 5 choices and placeholder text", () ->
  expect(2)
  visit('/tables/4')
  andThen () ->
    equal("4", find('.tab h2 span').text(), 'Table id 4 should be displayed in selected table pane')
    equal(5, find('.menu li > a').length, "5 food options should be visible in food selection pane")
