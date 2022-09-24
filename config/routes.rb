# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'pages/hello'
  root 'pages#hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "users#post"
  get "/users/:id/posts/:idp", to: "users#detail"
  
end
