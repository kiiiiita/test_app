Rails.application.routes.draw do
  root to: 'mypages#show'
  resources :users, only: %i(new create show)
  resources :sessions, only: %i(new create destroy)
  resources :mypages, only: %i(show)

  get 'login' => 'sessions#create', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout
end
