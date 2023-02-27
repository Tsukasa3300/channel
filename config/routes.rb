Rails.application.routes.draw do
  get "/login", to: 'sessions#new'
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  
  root  "static_pages#Home"
  get "static_pages/Home"

  get "/posts", to: "posts#index"
  get 'posts/show'

  get "users", to:'users#index'
  get 'users/update'
  get "/signup", to:'users#new'

resources :users
resources :posts do
  resources :comments
  resources :likes, only: [:create, :destroy]
end
resources :likes, only: [:create, :destroy]
end