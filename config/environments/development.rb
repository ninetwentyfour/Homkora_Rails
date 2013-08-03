Homkora::Application.configure do
  config.eager_load = false
  # Settings specified here will take precedence over those in config/application.rb
  config.cache_store = :dalli_store
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  # config.action_mailer.raise_delivery_errors = false
  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.sendgrid.net",
    :port           => "25",
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'hospitium.co'
  }
  # config.action_mailer.perform_deliveries = false
  # config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.default :charset => "utf-8"

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  config.assets.digest = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
