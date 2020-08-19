Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root "shops#index"
  resources :shops
end
