Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  resources :shops, only: [:new]
  resources :articles
end
