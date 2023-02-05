Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'users/show'
  get 'libraries/index'
  get 'libraries/show'
  get 'users/show'
  devise_for :users
  get 'posts/index'
  get'/post/category', to: "posts#category"
  root to: 'libraries#index'
  resources :posts do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    collection do
      get 'favorites'
    end
  end
  resources :libraries, only: [:index, :show]
end
