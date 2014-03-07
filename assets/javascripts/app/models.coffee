### global window:false, Ember: false, URI:false ###

App = window.App

App.Table = Ember.Model.extend
  tab: Ember.belongsTo('App.Tab', {key: 'tab_id'})

App.Tab = Ember.Model.extend
  tabItems: Ember.hasMany('App.TabItem', {key: 'tabitem_ids'})

  cents: (->
    return this.get('tabItems').getEach('cents').reduce(((accum, item) ->
      return accum + item)
    , 0)
  ).property('tabItems.@each.cents')

App.TabItem = Ember.Model.extend
  cents: Ember.attr('number'),
  food: Ember.belongsTo('App.Food', {key: 'food_id'})

App.Food = Ember.Model.extend
  name: Ember.attr('string')
  imageUrl: Ember.attr('string')
  cents: Ember.attr('number')

App.use_fixture_adapter = () ->
  App.Table.adapter = Ember.FixtureAdapter.create()
  App.Tab.adapter = Ember.FixtureAdapter.create()
  App.TabItem.adapter = Ember.FixtureAdapter.create()
  App.Food.adapter = Ember.FixtureAdapter.create()

  App.Table.FIXTURES = [
    id: 1
    tab_id: 1
  ,
    id: 2
    tab_id: 2
  ,
    id: 3
    tab_id: 3
  ,
    id: 4
    tab_id: 4
  ,
    id: 5
    tab_id: 5
  ,
    id: 6
    tab_id: 6
  ]

  App.Tab.FIXTURES = [
    id: 1
    tabitem_ids: []
  ,
    id: 2,
    tabitem_ids: [],
  ,
    id: 3,
    tabitem_ids: []
  ,
    id: 4,
    tabitem_ids: [400, 401, 402, 403, 404]
  ,
    id: 5,
    tabitem_ids: []
  ,
    id: 6,
    tabitem_ids: []
  ]

  App.TabItem.FIXTURES = [
    id: 400
    cents: 1500
    food_id: 1
  ,
    id: 401
    cents: 300
    food_id: 2
  ,
    id: 402
    cents: 700
    food_id: 3
  ,
    id: 403
    cents: 950
    food_id: 4
  ,
    id: 404
    cents: 2000
    food_id: 5
  ]

  App.Food.FIXTURES = [
    id: 1
    name: 'Pizza'
    imageUrl: 'img/pizza.png'
    cents: 1500
  ,
    id: 2
    name: 'Pancakes'
    imageUrl: 'img/pancakes.png'
    cents: 300
  ,
    id: 3
    name: 'Fries'
    imageUrl: 'img/fries.png'
    cents: 700
  ,
    id: 4
    name: 'Hot Dog'
    imageUrl: 'img/hotdog.png'
    cents: 950
  ,
    id: 5
    name: 'Birthday Cake'
    imageUrl: 'img/birthdaycake.png'
    cents: 2000
  ]

App.use_fixture_adapter()