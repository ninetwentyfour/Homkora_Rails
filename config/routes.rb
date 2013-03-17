Homkora::Application.routes.draw do
  root :to => "home#index"
  match "/api" => "home#api", :as => "api"
  match "/faq" => "home#faq", :as => "faq"
  match "/about" => "home#about", :as => "about"
  match "/privacy" => "home#privacy", :as => "privacy"
  match "/help" => "home#help", :as => "help"
  match "/airbrake" => "home#airbrake", :as => "airbrake"

  devise_for :users
  resources :token_authentications, :only => [:create, :destroy]
  resources :users, :only => [:show]
  
  match "projects/search" => "projects#search", :as => "projects_search"
  resources :projects
  
  match "timers/search" => "timers#search", :as => "timers_search"
  resources :timers
end
