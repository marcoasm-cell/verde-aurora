Rails.application.routes.draw do
  root 'application#index'
  resources :products
  resources :categories
  resources :contacts

  namespace :admin do
    root 'products#index'
    resources :products
    resources :categories
    resources :contacts
    resources :colors
    resources :fragances
    resources :orders
    resources :sessions
    resources :password_resets
  end
end
