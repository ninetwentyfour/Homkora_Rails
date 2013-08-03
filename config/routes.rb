Homkora::Application.routes.draw do
  root :to => "home#index"
  match "/api" => "home#api", :as => "api", :via => :get
  match "/faq" => "home#faq", :as => "faq", :via => :get
  match "/about" => "home#about", :as => "about", :via => :get
  match "/privacy" => "home#privacy", :as => "privacy", :via => :get
  match "/help" => "home#help", :as => "help", :via => :get
  # match "/airbrake" => "home#airbrake", :as => "airbrake"

  devise_for :users
  resources :token_authentications, :only => [:create, :destroy]
  resources :users, :only => [:show]
  
  match "projects/search" => "projects#search", :as => "projects_search", :via => :get
  resources :projects
  
  match "timers/search" => "timers#search", :as => "timers_search", :via => :get
  resources :timers
end
