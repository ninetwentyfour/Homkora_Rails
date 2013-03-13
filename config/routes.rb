Homkora::Application.routes.draw do
  resources :timers


  root :to => "home#index"
  match "/api" => "home#api", :as => "api"
  match "/faq" => "home#faq", :as => "faq"
  match "/about" => "home#about", :as => "about"
  match "/privacy" => "home#privacy", :as => "privacy"
  match "/help" => "home#help", :as => "help"

  devise_for :users
  resources :users, :only => [:show]

  resources :projects
end
