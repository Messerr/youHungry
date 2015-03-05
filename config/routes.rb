Rails.application.routes.draw do

  resources :users

  resources :restaurants

  resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :reply
  end
end
  resources :messages, only: [:new, :create]
  
  
  root 'welcome#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/unlike', to: 'restaurants#update'
  


end
