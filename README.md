This is a port of the peepcode Ordr app from the [peepcode ember
screencast][1] into a [mimosajs][2] project.

[1]:https://peepcode.com/products/emberjs
[2]:http://mimosajs.com
[3]:https://github.com/airportyh/testem
[4]:http://qunitjs.com
[5]:https://github.com/mmonteleone/pavlov
[6]:https://github.com/Ember-SC/peepcode-ordr-test/
[7]:http://bower.io/

It's written in coffeescript, stylus, emblem, (and jade for the index.html -- but note that
this could easily be re-written to static html if desired).  There is a [testem][3] testsuite written
in [qunit][4] and [pavlov][5].  The test
suite is directly stolen from [here][6].

The intention is for all the 'front-end' assets to be downloaded via [bower][7], however the current
versions of emberjs and dependencies available on bower are out of date, so for now the project includes
manual downloads of the emberjs-starter-kit and handlerbars-1.0.0

How to install
--------------

1. Install mimosajs globally

        npm install -g mimosajs

2. Clone the mimosa-ordr-skeleton project

        git clone ..

3. Install the build/server dependencies

        cd mimosa-peepcode
        npm install

4. Install the front-end dependencies

        cd mimosa-ordr-skeleton
        mimosa bower

How to Run
----------

    mimosa watch --server

This runs mimosa in watch mode and starts up the project's nodejs server with live-reload
support.

This processes the contents of the ./assets directory, placing compiled/processed
representations into the ./public directory.

The ./assets directory is watched for changes -- when a change is made to the contents of the assets directory, the
relevant files are recompiled automatically.

The --server option fires up an expressjs http server listening at http://localhost:3000.
When assets are recompiled, the server will send any connected browsers a socketio message
telling them to reload -- the javascript at /reload-client.js adds support for this to the
browser page.

How to run tests
----------------

1. Install testem globally

        npm install -g testem

2. Start mimosa

        mimosa watch --server

3. Then in another terminal, start testem

        cd ./public
        testem

This fires up testem which starts an http server listening at http://localhost:7357
by default.

Connect any browser(s) to the testem http server port and watch the tests run.  You should see
all tests automatically rerun on all connected browsers when files in ./public change.

All the included tests should pass after project checkout, please report an issue if you notice
otherwise.

Overview of the file structure (see mimosajs.org for more mimosa details)
-------------------------------------------------------------------------

<dl>
<dt>mimosa-config.coffee</dt>
<dd>configuration file for mimosa</dd>

<dt>mimosa-config.defaults.coffee</dt>
<dd>documents all mimosa configuration options and
their default values -- it doesn't control any behavior.
This file is produced by running `mimosa config`.</dd>

<dt>./assets/</dt>
<dd>all files in this tree are processed by mimosa.
each file will produce some kind of representation
in the ./public directory depending on
which preprocessor/compiler/mimosa module[s] is/are applied to the input file[s]
</dd>

<dt>./public</dt>
<dd>the output produced by the mimosa build process these are the artifacts that
should get served to the browser</dd>

<dt>server.coffee</dt>
<dd>starts a a basic expressjs server (note the default createServer method)</dd>

<dt>./routes</dt>
<dd>express routes -- the default just renders the index.jade view</dd>

<dt>./views</dt>
<dd>any express views -- automatically compiled by consolidate module from npm</dd>

<dt>bower.json</dt>
<dd>configuration file for bower frontend package manager </dd>

<dt>./assets/stylesheets</dt>
<dd>Stylesheets (can be written in stylus, sass, or css)</dd>

<dt>./assets/javascripts/app/app.coffee</dt>
<dd>ordr app rewritten in coffeescript</dd>

<dt>./assets/javascripts/app/models.coffee</dt>
<dd>ordr app models rewritten in coffeescript and Ember-Model instead of Ember-Data</dd>

<dt>./assets/javascripts/app/templates</dt>
<dd>
order app templates rewritten in emblem.  Files ending in .emblem or .hbs are precompiled with the appropriate compiler
based on the file extension.
They compile to public/app/compiled-handlebars.js and public/app/compiled-emblem.js.
The compiled files populate the Ember.TEMPLATES[] array in the manner expected by ember.
<p>ex: the template at templates/foo/bar.emblem will be available within the ember app as the
template with name 'foo/bar' (aka Ember.TEMPLATES['foo/bar'])</p>
</dd>

<dt>./assets/testrunner.html</dt>
<dd>test suite runner</dd>

<dt>./assets/javascripts/testing/</dt>
<dd>test suite</dd>

<dt>./assets/javascripts/vendor</dt>
<dd>vendor provided javascript -- aka external javascript dependencies</dd>

<dt>./assets/javascripts/bower_assets</dt>
<dd>bower managed javascripts</dd>

<dt>./assets/stylesheets/vendor/</dt>
<dd>vendor provided stylesheets</dd>