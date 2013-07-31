This is a port of the peepcode Ordr app from the peepcode ember
screencast [https://peepcode.com/products/emberjs] into a mimosajs project [http://mimosajs.com/].

It's written in coffeescript, stylus, emblem, (and jade for the index.html -- but note that
this could easily be re-written to static html if desired).  There is a testem testsuite written
in qunit [http://qunitjs.com/] and pavlov [https://github.com/mmonteleone/pavlov].  The test
suite is directly stolen from here. [https://github.com/Ember-SC/peepcode-ordr-test/]

How to install
--------------

1. Install mimosajs globally `npm install -g mimosajs`
2. Clone the mimosa-ordr-skeleton project `git clone ...`
3. Install the build/server dependencies `cd mimosa-ordr-skeleton; npm install`
4. Install the front-end dependencies `cd mimosa-ordr-skeleton; mimosa bower`
   (note the bower versions of the ember package seem to lag the official releases --
   so this project includes and uses a copy of the latest ember-starter-kit release)

How to Run
----------

`mimosa watch --server`

This runs mimosa in watch mode and starts up the project's nodejs server with live-reload
support.

The ./assets directory will be watched for changes -- processed versions of the source assets
are placed into ./public.  When a change is made to the contents of the assets directory, the
relevant files are recompiled automatically.

The --server option will start an expressjs http server listening at http://localhost:3000.
When assets are recompiled, the server will send any connected browsers a socketio message
telling them to reload (if the page includes the /reload-client.js script)

How to run tests
----------------

1. Install testem globally (npm install -g testem)

`mimosa watch --server` <-- setup the compilation

in another terminal window

```
cd ./public
testem
```

This fires up testem [https://github.com/airportyh/testem] which starts the testem http server
(http://localhost:.

Connect any browser(s) to the testem http server port and watch the tests run.  Tests are
automatically rerun on all connected browsers when files in ./public change.  All tests should
pass after project checkout.

Quick intro to the file structure (see mimosajs.org for more mimosa details)
----------------------------------------------------------------------------

# configuration file for mimosa
mimosa-config.coffee

# this file documents all mimosa configuration options and
# their default values -- it doesn't control any behavior
# this file is produced by running `mimosa config`
mimosa-config.defaults.coffee

# project source -- all files in this tree are processed by mimosa
# each file will produce some kind of representation in the ./public directory depending on
# which preprocessor/compiler/mimosa module[s] is/are applied to the input file[s]
./assets/

# the output produced by the mimosa build process these are the artifacts that
# should get served to the browser
./public

# there is included a simple example express server
# in this app it just renders the index.jade view (which could easily be rewritten in
# html) and the contents of the ./public directory
server.coffee  <-- starts a a basic expressjs server (note the default createServer method)
./routes  <-- express routes
./views   <-- express views

# configuration file for bower frontend package manager [http://bower.io/]
bower.json

# styleseets
./assets/stylesheets

# ordr app rewritten in coffeescript
./assets/javascripts/app/app.coffee

# ordr app models rewritten in coffeescript and Ember-Model instead of Ember-Data
./assets/javascripts/app/models.coffee

# order app templates rewritten in emblem
# Files within ./assets/javascripts/app/template are precompiled with emblem or handlebars
# based on the file extension.
# They compile to public/app/compiled-handlebars.js and public/app/compiled-emblem.js
# The compiled files populate the Ember.TEMPLATES[] array in the manner expected by ember
# the template at templates/foo/bar.emblem will be available within the ember app as the
# template with name 'foo/bar' (aka Ember.TEMPLATES['foo/bar'])
./assets/javascripts/app/templates

# test suite runner
./assets/javascripts/testing/

# vendor provided javascript
./assets/javascripts/vendor

# bower managed javascripts
./assets/javascripts/bower_assets