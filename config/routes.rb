Rails.application.routes.draw do
  get 'libraries/index'
  get 'libraries/show'
  get 'acounts/show'
  devise_for :users
  get 'posts/index'
  root to: 'libraries#index'
  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only:[:create, :destroy]
  end
  resources :acounts, only: :show
  resources :libraries, only: [:index, :show]
end
