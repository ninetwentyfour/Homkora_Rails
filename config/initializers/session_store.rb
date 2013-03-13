# Be sure to restart your server when you modify this file.

Homkora::Application.config.session_store :cookie_store, key: '_homkora_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Homkora::Application.config.session_store :active_record_store
if Rails.env == "test"
  Homkora::Application.config.session_store :cookie_store, key: '_homkora_session'
else
  #AnimalTracker::Application.config.session_store :active_record_store
  require 'action_dispatch/middleware/session/dalli_store'
  Homkora::Application.config.session_store :dalli_store, :namespace => 'sessions', :key => '_foundation_session', :expire_after => 90.minutes
end