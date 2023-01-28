Rails.application.routes.draw do
  get 'libraries/index'
  get 'libraries/show'
  get 'acounts/show'
  devise_for :users
  get 'posts/index'
  get'/post/category', to: "posts#category"
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
