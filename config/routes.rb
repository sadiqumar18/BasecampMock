Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "projects#index"

  # registration and login routes

  #handles registration
  get :register, to: "auth#register"
  post :register, to: "auth#create_account"

  #handles login
  get :login, to: "auth#login"
  post :login, to: "auth#login"

  get :logout, to: "auth#logout", as: "logout"

  # other routes

  resources :tasks
  resources :projects
  resources :users, as: "users"
end
