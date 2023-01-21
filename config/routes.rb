Rails.application.routes.draw do
  get 'libraries/index'
  get 'acounts/show'
  devise_for :users
  get 'posts/index'
  root to: 'libraries#index'
  resource :posts, only: [:index, :new, :create]
  resources :acounts, only: :show
end
