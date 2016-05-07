Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :home, only: [:index]

  resources :products, only: [:index]

  root 'products#index'
end
