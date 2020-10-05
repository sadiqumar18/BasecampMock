Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # registration and login routes
  get :login, to: "auth#create"
  get :register, to: "auth#register"
  get :logout, to: "auth#logout"

  # other routes

  resources :tasks
  resources :projects
end
