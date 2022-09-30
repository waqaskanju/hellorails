# frozen_string_literal: true

Rails.application.routes.draw do

  # to allow authenitication mechansim in users Controller.
  
  devise_for :users
  # get 'pages/hello'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # get "/users/:id/posts", to: "users#post"
  # get "/users/:id/posts/:idp", to: "users#detail"
  # get "posts", to: "posts#index"
  # post "/posts(.:format)", to:  "posts#create"
  # get "/posts/new", to: "posts#new"
  # get "/likes/new", to: "likes#new"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:new, :create]
    end
  end

end
