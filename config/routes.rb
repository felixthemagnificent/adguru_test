Rails.application.routes.draw do
  resources :tickets
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    member do
      get 'switch_status'
      post 'switch_status' => 'users#process_status'
    end
  end
end
