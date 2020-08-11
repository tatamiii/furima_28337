Rails.application.routes.draw do
  get 'shops/index'
  root "shops#index"
end
