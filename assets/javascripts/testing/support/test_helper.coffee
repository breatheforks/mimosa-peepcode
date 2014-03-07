
Ember.Test.registerHelper 'currentRouteName', (app) ->
  appController = app.__container__.lookup('controller:application')
  return Ember.get(appController, 'currentRouteName')

Ember.Test.registerHelper 'getFoodController', (app, selector, ctx) ->
  return app.__container__.lookup("controller:" + "food")

App.rootElement = "#qunit-fixture"
App.setupForTesting()
App.injectTestHelpers()
