Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'shops#index'
  get 'search', to: 'search#search'

  resources :users, only: [:edit, :update] do
    resources :likes, only: [:index]
    resources :rates, only: [:index]
  end

  resources :shops, only: [:index, :show] do
    resources :likes, only: [:create]
    resources :rates, only: [:new, :update]
  end

  namespace :genres do
    match "ramen", :via => :get
    match "sushi", :via => :get
  end
end
