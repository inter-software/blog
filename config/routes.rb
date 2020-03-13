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
    resources :comments, module: :articles
  end

  resources :publications do
    resources :comments, module: :publications
  end

  resources :users do
    resources :emergencies, controller: :contacts, type: 'Emergency'
    resources :friends, controller: :contacts, type: 'Friend'
  end

  # resources :categories do
  #  resources :articles
  # end

  resources :verifieds do
    resources :users
    resources :articles
  end


  resources :surveys do

    resources :questions do
      resources :answer_options
    end

  end


  resources :messages

  root to: 'home#index'

end
