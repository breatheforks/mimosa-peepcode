# this coffeescript file generates a json object which configures the entirety of mimosa operation
# the below values are the only things changed from default -- comments describing the behavior of all fields
# and the default settings are located in mimosa-config-comments.coffee

exports.config = {

  # we use these mimosa modules
  modules: ['bower', 'lint', 'minify', 'server', 'live-reload']

  # limit file watcher to 100 simultaneously open file handlers at a time -- since the files are processed
  # asynchronously, without this option file processing could otherwise open all the files at essentially
  # the same time on startup and could hit the os's file handle limit
  watch:
    throttle: 100

  # enable coffeescript with sourcemap support and compile all coffeescript files with the default function wrapper
  # (mimosa default is bare:true because that is best if you are using requirejs -- this project does not use requirejs however)
  coffeescript:
    sourceMap:true
    bare:false

  # don't wrap generated templates in amd modules, output ember compatible pre-compiled tempalates to compiled-handlebars.js and compiled-emblem-js
  # These files just add the expected template functions to the Ember.Templates[] so that Ember template discovery functions normally
  template:
    amdWrap: false

    # this section will configure the template compiler to precompile any .hbs and .emblem templates within the assets/javascripts/templates/ directory
    # with the correct 'name' -- so a template at templates/somedir/foo.emblem will map to the ember template 'somedir/foo'
    nameTransform: (path) ->
      m = path.match /templates?\/(.*)$/
      if m?.length and m.length == 2
        return m[1]
      path = path.split '/'
      return path[path.length - 1]
  
    outputFileName:
      handlebars:"compiled-handlebars"
      emblem:"compiled-emblem"

    handlebars:
      lib: require('handlebars')
      helpers:["app/handlebars-helpers"]
      ember:
        enabled: true

  # this disables linting or any mimosa processing of the vendor files
  justCopy:
    paths:["javascripts/vendor"]

  # configures mimosa bower module to place any bower installed assets in 
  # assets/javascripts/vendor/bower_assets/{package_name}/{} or assets/stylesheets/vendor/bower_assets/{package_name}/{}
  bower:
    copy:
      outRoot: "bower-assets"

  # sets up a simple express server with support for jade templates
  server:
    views:
      compileWith: 'jade'
      extension: 'jade'
      path: 'views'
}