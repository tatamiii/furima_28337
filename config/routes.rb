Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/new'
  devise_for :users
  root "exhibitions#index"
  # resources :shops
  resources :exhibitions
end
