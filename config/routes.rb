Rails.application.routes.draw do
  resources :attachments
  # resources :thread_messages, path: "thread_messages/:project_thread_id"
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
  post "thread_messages/:project_thread_id", to: "thread_messages#create", as: "create_thread_message"
  get "thread_messages/:project_thread_id/reply/:parent_message_id", to: "thread_messages#new", as: "reply_thread_message"
  post "thread_messages/:project_thread_id/reply/:parent_message_id", to: "thread_messages#reply"
  get "thread_messages/:project_thread_id", to: "thread_messages#new", as: "get_thread_message_form"
  get "thread_messages/:id/show", to: "thread_messages#show", as: "show_thread_message"
  get "thread_messages/:id/edit/:project_thread_id", to: "thread_messages#edit", as: "edit_thread_message"
  post "thread_messages/:id/edit/:project_thread_id", to: "thread_messages#update"
  delete "thread_messages/:id", to: "thread_messages#destroy", as: "delete_thread_message"
  # get "thread_messages/:id/edit/:project_thread_id", to: "thread_messages#edit", as: "edit_thread_message"
  # other routes

  resources :tasks
  resources :projects
  resources :users, as: "users"
end
