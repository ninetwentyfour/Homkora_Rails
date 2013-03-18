Homkora | Time Tracking Made Simple
========
[![Build Status](https://travis-ci.org/ninetwentyfour/Homkora_Rails.png?branch=master)](https://travis-ci.org/ninetwentyfour/Homkora_Rails) [![Dependency Status](https://gemnasium.com/ninetwentyfour/Homkora_Rails.png)](https://gemnasium.com/ninetwentyfour/Homkora_Rails)

Created By: [Travis Berry][2]

[http://twitter.com/homkora][9]

Usage: 
===============
The code specific to this app is released under an [unlicense][10]. I would like it if you kept the link to my site at the bottom, but you don't have to.

Awesome Icons from [http://blog.twg.ca/2009/09/free-iphone-toolbar-icons/][7]

Fantastic stopwatch jquery plugin was made by [kellishaver][8]

 
Download:
=========
Download latest version from [https://github.com/ninetwentyfour/Homkora_Rails][1]

Install:
=========

Homkora works best when deployed to Heroku. It requires a Amazon s3 account, a SendGrid account, a MongoHQ and a IndexDen Account.

First download the latest homkora source.

    git clone https://github.com/ninetwentyfour/Homkora_Rails.git

    cd Homkora_Rails

You should have the heroku command available if you've installed the heroku gem correctly. You can read the [Heroku help](https://devcenter.heroku.com/articles/heroku-command) for configuring the gem once it's installed.

Create a new Heroku application.

    heroku create

You will need to add the SendGrid addon (this requires a verified account).

    heroku addons:add sendgrid:starter

A MongoHQ account is required as well.

    heroku addons:add mongohq:sandbox

Add IndexDen the same way

    heroku addons:add indexden:test

You will also need to set a couple configuration variables.

    heroku config:add S3_KEY=YOUR_S3_KEY

    heroku config:add S3_SECRET=YOUR_S3_SECRET

    heroku config:add HOMKORA_FOG_DIRECTORY=YOUR_S3_BUCKET

    heroku config:add CLOUDFRONT_URL=YOUR_BASE_CLOUDFRONT_URL # This is for the compiled assets to be served off of cloudfront, can also be s3 base url

After the configuration variables are added, you can deploy the app.

    git push heroku master

Compile the assets

    heroku run rake assets:precompile

Create the MongoDB indexes

    heroku run rake db:mongoid:create_indexes

When the deploy is finished, you can test the install with

    curl http://YOUR_HEROKU_APP_URL/

????

Profit

Todo:
======================== 

<del>Only show user projects and timers in add timer drop downs - only shows user data everywhere else</del>

<del>Make timers editable starting with saved time</del>

<del>FAQ About Privacy Contact and Instruction pages</del>

<del>Add page for users to modify password and account details</del>

Redirect with warning if new user creates timer with no projects first

Documentation for API

Add users - Edit Users - APIs

<del>Flash Message colors</del>

<del>Hide Flash Message after period of time</del>

<del>Delete timers associated with projects on project delete</del>

<del>Form validation - custom error messages</del>

<del>Add checks and redirect/show message on user attempt to edit/view other user data</del>

<del>Add email to User table</del>

<del>Confirm user account with email</del>

Generate graphs of time records

Premium accounts

<del>Improved event logging</del>

<del>Export data as a csv</del>

<del>Pretty much everything at this point.</del>


Disclaimer:
===========
I'm in no way responsible for anything you do with this. If this breaks anything of yours, I'm not responsible for that either.

  [1]: https://github.com/ninetwentyfour/Homkora_Rails
  [2]: http://www.travisberry.com
  [3]: http://cakephp.org/
  [4]: http://www.opensource.org/licenses/mit-license.php
  [5]: http://book.cakephp.org/view/914/Production
  [6]: http://book.cakephp.org/view/922/Database-Configuration
  [7]: http://blog.twg.ca/2009/09/free-iphone-toolbar-icons/
  [8]: https://github.com/kellishaver/stopwatch
  [9]: http://twitter.com/homkora
  [10]: http://unlicense.org/
  [11]: http://bakery.cakephp.org/articles/alkemann/2008/10/21/logablebehavior
  [12]: https://github.com/interlock/acl_plugin
  [13]: http://code.google.com/p/phamlp/
  [14]: http://michelf.com/projects/php-markdown/