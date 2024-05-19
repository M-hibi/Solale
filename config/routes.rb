Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  resources :users, only: [:show, :edit, :update]
  get   '/users/confirm',  to: 'users#confirm'
  patch  '/users/withdraw', to: 'users#withdraw'
  resources :posts, only: [:index, :show, :create, :edit, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :reports, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
