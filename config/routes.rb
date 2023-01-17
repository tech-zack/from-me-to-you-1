Rails.application.routes.draw do
  get 'acounts/show'
  devise_for :users
  get 'posts/index'
  root to: "posts#index"
  resources :acounts, only: :show
end
