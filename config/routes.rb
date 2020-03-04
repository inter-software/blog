# frozen_string_literal: true

Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'home/index'

  get 'welcome/index'

  get 'surveys/index'

  # Prefix: edit_surveys Verb: GET  URI Pattern: /surveys/:id/edit  Controller#Action: surveys#edit
  get 'surveys/:id/edit', to: 'surveys#edit'

  # Prefix: new_surveys Verb: GET   URI Pattern: /surveys/new   Controller#Action: surveys#new
  get '/surveys/new'

  get 'surveys/:id/destroy', to: 'surveys#destroy'


  # get 'categories/:category_id', to: 'articles#index', as: :category

  resources :articles do
    resources :comments do
      resource :publications, module: :comments
    end
    resource :publications, module: :articles
  end

  # resources :categories do
  #  resources :articles
  # end

  resources :verifieds do
    resources :users
    resources :articles
  end


  resource :surveys, only: %i[:index :show :edit :new :destroy] do
    resource :questions, only: %i[:index :show :edit :new :destroy]
  end


  resources :messages

  root to: 'home#index'

end
