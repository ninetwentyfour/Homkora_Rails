source 'https://rubygems.org'
ruby "2.1.0"

gem 'rails', '4.0.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mongoid", github: 'mongoid/mongoid'

gem "devise"
gem "canard"

gem 'haml-rails'
gem "redcarpet"

gem 'will_paginate_mongoid'
gem 'gravatar_image_tag'
gem "comma"
gem 'dalli'
gem 'sendgrid'

# Search
gem 'tanker'

gem 'unicorn'

gem 'jquery-rails'

# add these gems to help with the transition to rails4:
gem 'protected_attributes'

group :production, :development do
	gem 'asset_sync'

  gem 'sass-rails', "4.0.1"
  gem 'coffee-rails', "4.0.1"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
  gem 'closure-compiler'
end

gem "rspec-rails", :group => [:test, :development]
# Gems used only for testing
group :test do
  gem "database_cleaner"
  gem "mongoid-rspec", :github => "ninetwentyfour/mongoid-rspec"
	gem 'fabrication'
	gem 'faker'
	gem 'shoulda-matchers'
  gem 'mocha', "~> 0.13.2", :require => false
	gem 'fakeweb'
	gem 'vcr'
  gem 'simplecov', :require => false
  gem 'coveralls', :require => false
end

group :production do
  gem 'newrelic_rpm'
  gem "airbrake"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
