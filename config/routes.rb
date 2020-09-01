Rails.application.routes.draw do

  devise_for :users
  root "exhibitions#index"
  resources :exhibitions

  resources :orders
end
