Rails.application.routes.draw do
  devise_for :users
  root 'group#index'

  resources :users, only: [:index, :edit, :update]
  resources :group, only: [:index, :new, :edit]
end
