# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'pages/hello'
  root 'pages#hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # get "/users/:id/posts", to: "users#post"
  # get "/users/:id/posts/:idp", to: "users#detail"
  # get "posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  
  resources :users, only: [:index, :show, :post, :detail] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end

end
