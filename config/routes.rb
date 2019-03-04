Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes, only: [:index, :show] do
    resources :comments, only: :create
    resources :quantities, only: [:new, :create]
  end

  resources :quantities, only: :destroy
  resources :likes, only: [:create, :destroy]
  resources :comments, only: :destroy
  resources :countries, only: :index
end

