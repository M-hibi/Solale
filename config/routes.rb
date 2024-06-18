Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {sessions: 'admin/sessions'}

  namespace :admin do
    resources :reports, only: [:index, :update, :destroy]
    resources :users, only: [:destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"

    resources :users, only: [:show, :edit, :update] do
      get   '/users/:id/confirm',  to: 'users#confirm', as: 'users_confirm'
      patch  '/users/:id/withdraw', to: 'users#withdraw', as: 'users_withdraw'
      resource :follows, only: [:create, :destroy]
      get "followings" => "follows#followings", as: "followings"
      get "followers" => "follows#followers", as: "followers"
      member do
      get :followings, :followers
      end
    end

    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      resource :reports, only: [:create, :destroy]
    end
    get "search", to: 'posts#search', as: 'posts_search'

    resources :notifications, only: [:index, :destroy]

    devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end

  end

end
