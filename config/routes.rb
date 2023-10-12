# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create new] do
      resources :likes, only: [:create]
      resources :comments, only: %i[create new]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
