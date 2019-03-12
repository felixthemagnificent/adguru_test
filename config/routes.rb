Rails.application.routes.draw do
  resources :tickets
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
