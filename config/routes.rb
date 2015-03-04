Rails.application.routes.draw do

resources :users

resources :messages do
  member do
    post :new
  end
end
resources :conversations do
  resource :messages
  member do
    post :reply
    post :trash
    post :untrash
  end
 collection do
    get :trashbin
    post :empty_trash
 end
 end

  root 'welcome#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'




end
