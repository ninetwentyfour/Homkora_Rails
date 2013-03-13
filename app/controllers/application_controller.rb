class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # redirect to /admin after all logins
  def after_sign_in_path_for(resource_or_scope)
    '/projects'
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "Default error message"
    redirect_to root_url, :notice => "That URL is prohibited"
  end
end
