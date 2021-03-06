Starter - Sails.js coffee
=========================

Sails.js starter, collection for most usage library.

We use [NPM-script](https://docs.npmjs.com/misc/scripts) instead of [gulp](http://gulpjs.com/).

pre-install
-----------

-	node.js@0.10.26
-	npm
-	[coffeescript](http://coffeescript.org/)
-	[sass](http://sass-lang.com/install)
-	[compass](http://compass-style.org/install/)
-	[bootstrap](https://github.com/twbs/bootstrap-sass)
-	[grunt](http://gruntjs.com/)
-	[sails.js@0.11.0rc](http://sailsjs.org/)

how to start
------------

```
npm start
open http://localhost:1337
```

before init project
-------------------

```
npm run build
```

watch project
-------------

```
npm run watch
```

or

```
grunt watch
```

##include

-	jade
-	coffeescript support
-	sass config
-	include compass
-	include bootstrap (sass)

#use docker compose start

clone repo
----------

1.	ec-platform and jquery-mobile-cart-demo put in same folder
2.	cd ec-platform

create database in docker
-------------------------

1.	docker-compose up mysql
2.	use mysql client create database name: ec_platform.

docker-compose up.
------------------

1.	docker-compose up
2.	now you can use docker demo the web side
