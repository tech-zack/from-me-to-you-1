Rails.application.routes.draw do
  get 'libraries/index'
  get 'libraries/show'
  get 'acounts/show'
  devise_for :users
  get 'posts/index'
  root to: 'libraries#index'
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :acounts, only: :show
  resources :libraries, only: [:index, :show]
end
