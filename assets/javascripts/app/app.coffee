### global App:false, Ember:false, localStorage:false, window:false ###

window.App = App = Ember.Application.create(
  LOG_TRANSITIONS: true
)

# Router
App.Router.map () ->
  @resource 'tables', () ->
    @resource 'table', path: ':table_id'

App.ApplicationRoute = Ember.Route.extend
  needs: ['food']
  setupController: () ->
    @controllerFor('food').set('model', App.Food.find())

App.TablesRoute = Ember.Route.extend
  model: () ->
    return App.Table.find()

App.TableRoute = Ember.Route.extend
  model: (params) ->
    return App.Table.find(params.table_id)

App.IndexRoute = Ember.Route.extend
  redirect: () ->
    @.transitionTo('tables')

#App.TablesIndexRoute = Ember.Route.extend
#  renderTemplate: () ->
#    @render('tablesindex')

# Controllers

App.TableController = Ember.ObjectController.extend()

App.FoodController = Ember.ArrayController.extend(
  sortProperties: ['id']
  needs: ['table']
  addFood: (food) ->
    table = @get('controllers.table.model')
    tabItems = table.get('tab.tabItems')

    newItem = App.TabItem.create({
      food: food
      cents: food.get('cents')})

    tabItems.pushObject(newItem)
)

# auto generated
#App.TabController = Ember.ObjectController.extend()

console.log('reloaded')

