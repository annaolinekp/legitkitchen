Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes, only: [:index, :show, :new, :create] do
    resources :comments, only: :create
    resources :quantities, only: [:new, :create]
  end

  resources :user, only: :show
  resources :quantities, only: :destroy
  resources :likes, only: [:create, :destroy]
  resources :comments, only: :destroy
  resources :countries, only: [:index, :show]
end

