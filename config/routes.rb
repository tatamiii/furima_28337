Rails.application.routes.draw do

  devise_for :users
  root "exhibitions#index"
  resources :exhibitions

  # root to: 'orders#index'
  resources :orders
end
