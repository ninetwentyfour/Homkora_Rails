source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mongoid"

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


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
  gem 'closure-compiler'
end

gem 'jquery-rails'

group :production, :development do
	gem 'asset_sync'
end

gem "rspec-rails", :group => [:test, :development]
# Gems used only for testing
group :test do
  gem "database_cleaner"
  gem "mongoid-rspec"
	gem "factory_girl_rails"
	gem 'shoulda-matchers'
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
