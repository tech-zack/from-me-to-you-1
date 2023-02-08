Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
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
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'favorites'
    end
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :libraries, only: [:index, :show]
end
