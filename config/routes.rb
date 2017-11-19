Rails.application.routes.draw do
  get '/' => 'sessions#welcome', as: 'welcome'
  get '/signin' => 'sessions#new', as: 'signin'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  resources :users, only: [:show, :new, :create, :edit]
  resources :attractions
  resources :rides, only: [:create]
end
