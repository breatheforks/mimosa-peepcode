### global Ember:false, Handlebars:false ###

Ember.Handlebars.registerBoundHelper 'example-helper', ->
	new Handlebars.SafeString "This is coming from a Handlebars helper function written in CoffeeScript"

Ember.Handlebars.registerBoundHelper 'money', (value) ->
	if value % 100 == 0 
		"#{value / 100}.00"
	else
		"#{parseInt(value / 100, 10)}.#{value % 100}"

