# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'home/index'

  get 'welcome/index'



  # get 'categories/:category_id', to: 'articles#index', as: :category

  resources :articles do
    resources :comments
  end

  # resources :categories do
  #  resources :articles
  # end

  resources :verifieds do
    resources :users, only: %i[new edit]
    resources :articles, only: %i[new edit]
  end

  resources :messages

  root to: 'home#index'

end
