This is a port of the peepcode Ordr app from the [peepcode ember screencast][1] into a [mimosa][2] project.

[1]:https://peepcode.com/products/emberjs
[2]:http://mimosa.io
[3]:https://github.com/airportyh/testem
[4]:http://qunitjs.com
[5]:https://github.com/mmonteleone/pavlov
[6]:https://github.com/Ember-SC/peepcode-ordr-test/
[7]:http://bower.io/

The app is written in coffeescript, stylus, emblem, and statically compiled jade.  It includes a [testem][3] driven
testsuite running in [qunit][4] testrunner.  The test suite was originally stolen from [here][6] -- however this
project has been updated to the newest Ember.Testing conventions.

The front-end javascript assets are downloaded via [bower][7].

How to install
--------------

1. Install mimosa globally

        npm install -g mimosa

2. Clone the mimosa-peepcode project from github or run:

        mimosa skel:new ember-peepcode

3. Install the server dependencies

        cd ember-peepcode
        npm install


How to Run
----------

From within the root of the project directory:

    mimosa watch --server

This runs mimosa in watch mode and starts up the project's nodejs server with live-reload
support.

The contents of the ./assets directory are processed by mimosa -- compiled or otherwise processed
representations of asset files are written to the ./public directory.

When started in watch mode the ./assets directory is watched for changes -- when a change is made to the contents of
the assets directory, the relevant files are recompiled automatically.

The --server option fires up an expressjs http server listening at http://localhost:3000.
When assets are recompiled, the server will send any connected browsers a socketio message
telling them to reload -- the javascript available from the embedded webserver at /reload-client.js adds support for
this to the browser page.

How to run tests
----------------

1. Install testem globally

        npm install -g testem phantomjs

2. Run `mimosa build` -- after project build, the testsuite will be run headlessly inside phantomjs

3. When in watch mode, the test suite is run after every file modification

        mimosa watch --server

4. You can also run the tests via testem (launch/connect multiple browsers, run tests in them all as slaves -- its great, check out the testem project for more details!)

        testem

5. Finally, if you are just getting started with understanding the test suite and you want to run it directly
you can start the project server and point your browser at http://localhost:3000/testrunner.html

All the included tests should pass after project checkout, please report an issue if you notice
otherwise.

Overview of the file structure
------------------------------

<dl>
<dt>mimosa-config.coffee</dt>
<dd>configuration file for mimosa</dd>

<dt>mimosa-config-documented.coffee</dt>
<dd>documents all mimosa configuration options and
their default values -- it doesn't control any behavior.
This file is produced by running `mimosa config` -- running the command again will regenerate the file to
reflect the current mimosa module versions.</dd>

<dt>./assets/</dt>
<dd>all files in this directory are processed by mimosa.
each file will produce some kind of representation
in the ./public directory depending on
which preprocessor/compiler/mimosa module[s] is/are applied to the input file[s]
</dd>

<dt>./public</dt>
<dd>the output produced by the mimosa build process.  These are the artifacts that
should get served to the browser</dd>

<dt>server.coffee</dt>
<dd>starts a a basic expressjs server (note the default createServer method)</dd>

<dt>./routes</dt>
<dd>express routes -- nothing happening in this app as this app doesn't do anything dynamically in the server</dd>

<dt>./views</dt>
<dd>any server side views would go here</dd>

<dt>bower.json</dt>
<dd>configuration file for bower frontend package manager</dd>

<dt>./assets/index.html.jade</dt>
<dd>Jade static html template which loads the application.  This template is compiled by mimosa (via client-jade-static
module) and then immediately executed to produce an html file.  The html file it produces is written to
public/index.html -- the entry point for the application.
</dd>

<dt>./assets/testrunner.html.jade</dt>
<dd>Jade html template which loads the test suite.  This template is also statically compiled by mimosa-client-jade-static
It produces the file at public/testrunner.html which runs the testsuite.
</dd>

<dt>./assets/stylesheets</dt>
<dd>Stylesheets (can be written in stylus, less, sass, or css)</dd>

<dt>./assets/javascripts/app/app.coffee</dt>
<dd>peepcode-ordr app rewritten in coffeescript</dd>

<dt>./assets/javascripts/app/models.coffee</dt>
<dd>ordr app models rewritten in coffeescript and using Ember-Model rather than Ember-Data</dd>

<dt>./assets/javascripts/app/templates</dt>
<dd>
order app templates.
Files ending in .emblem or .hbs are precompiled with the appropriate compiler
based on the file extension.
They compile to public/app/compiled-handlebars.js and public/app/compiled-emblem.js.
The compiled files populate the Ember.TEMPLATES[] array in the manner expected by ember.
<p>ex: the template at templates/foo/bar.emblem will be available within the ember app as the
template with name 'foo/bar' (aka Ember.TEMPLATES['foo/bar'])</p>
</dd>

<dt>./assets/javascripts/testing/support/test_helper.coffee</dt>
<dd>Configure application for ember testing environment.  Defined test helpers</dd>

<dt>./assets/javascripts/testing/integration/*.coffee</dt>
<dd>integration tests</dd>

<dt>./assets/javascripts/vendor/bower_assets</dt>
<dd>bower managed javascript dependencies</dd>

<dt>./assets/stylesheets/vendor/bower_assets</dt>
<dd>bower managed stylesheet dependencies</dd>

</dl>