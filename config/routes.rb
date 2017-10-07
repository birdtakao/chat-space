Rails.application.routes.draw do
  devise_for :users
  root 'group#index'

  resources :users, only: [:index]
end
