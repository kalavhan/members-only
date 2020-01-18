Rails.application.routes.draw do
  get 'users/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  root 'posts#index'
  resources :posts, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
end
