# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' } # Use your custom registrations controller

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create new] do
      resources :likes, only: [:create]
      resources :comments, only: %i[create new]
    end
  end
end
