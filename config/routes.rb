Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :recipes do
    resources :comments, only: :create
    resources :quantities, only: [:new, :create, :edit, :update]
    resources :saved_recipes, only: [:new, :create]
  end

  resources :users, only: :show
  resources :quantities, only: :destroy
  resources :saved_recipes, only: :destroy
  resources :comments, only: :destroy
  resources :countries, only: [:index, :show]
end
