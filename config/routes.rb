Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :orders
end
