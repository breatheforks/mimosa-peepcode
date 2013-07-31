This is a port of the peepcode Ordr app from the peepcode ember
screencast [https://peepcode.com/products/emberjs] into a mimosajs project [http://mimosajs.com/].

It's written in coffeescript, stylus, emblem, (and jade for the index.html -- but note that
this could easily be re-written to static html if desired).  There is a testem testsuite written
in qunit [http://qunitjs.com/] and pavlov [https://github.com/mmonteleone/pavlov].  The test
suite is directly stolen from here. [https://github.com/Ember-SC/peepcode-ordr-test/]

How to install
--------------

1. Install mimosajs globally (npm install -g mimosajs)
2. Clone the mimosa-ordr-skeleton project (git clone ...)
3. Install the build/server dependencies (`cd mimosa-ordr-skeleton; npm install`
4. Install the front-end dependencies (`cd mimosa-ordr-skeleton; mimosa bower`

How to Run
----------

This will compile the ./assets directory to ./public and turns on file watching of the assets
directory.  When an asset changes it will be recompiled automatically.

the --server option will start an expressjs http server listening at http://localhost:3000.  When
assets are recompiled, any browsers connected to localhost:3000 will be automatically reloaded.

mimosa watch --server


How to run tests
----------------

1. Install testem globally (npm install -g testem)

mimosa watch --server  <-- setup the compilation

in another terminal window

```bash
cd ./public
testem
```

This fires up testem [https://github.com/airportyh/testem] which starts an http server.
Connect any browser(s) to the testem http server port and watch the tests run.  Tests are
automatically rerun on all connected browsers when files in ./public change.  All tests should
pass after project checkout.

Quick intro to the file structure (see mimosajs.org for more details)
---------------------------------------------------------------------

# configuration file for mimosa
mimosa-config.coffee

# this file is not used -- it just documents all mimosa configuration options and
# their default values
# this is the same file produced by running `mimosa config`
mimosa-config-comments.coffee

# project source -- all files in this tree are processed by mimosa
# each file will produce some kind of representation in the ./public directory depending on
# which preprocessor/compiler/mimosa module[s] is/are applied to the input file[s]
./assets/

# the output produced by the mimosa build process, these are the artifacts that
# should get served to the browser
./public

# there is included a simple example express server
# in this app it just renders the index.jade view (which could easily be rewritten in
# html) and the contents of the ./public directory
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
# these are precompiled with emblem or handlebars based on the file extension
# These compile to public/app/compiled-handlebars.js and public/app/compiled-emblem.js
# The compiled files populate the Ember.Template[] variable in the manner expected by ember
# the template at templates/foo/bar.emblem will be available within the ember app as the
# template with name 'foo/bar'
./assets/javascripts/app/templates

# test suite runner
./assets/javascripts/testing/

# vendor provided javascript
./assets/javascripts/vendor

# bower managed javascripts
./assets/javascripts/bower_assets