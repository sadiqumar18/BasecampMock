Rails.application.routes.draw do
  resources :attachments
  resources :thread_messages
  resources :project_threads
  resources :collaborators, path: "collaborators/:project_id"
  # get 'welcome/index'

  # root "welcome#index"
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

  get "get_threads/:id", controller: "project_threads", action: "threads", as: "get_project_thread"
  get "get_attachments/:id", controller: "attachments", action: "attachment", as: "get_attachments"

  # other routes

  resources :tasks
  resources :projects
  resources :users, as: "users"
end
