Rails.application.routes.draw do
  get 'login' => 'sessions#create', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout

  resources :users, only: %i(new create show)
  resources :sessions, only: %i(new create destroy)
  resources :mypages, only: %i(show)
  resources :qiitas, only: %i(index)
  resources :restaurants
  resources :blogs

  namespace :api do
    resources :mypages, only: %i(index)
  end

  root to: 'mypages#show'
end
