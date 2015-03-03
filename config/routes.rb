Rails.application.routes.draw do

resources :users

  root 'welcome#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'




end
