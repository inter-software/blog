Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

  get 'home/index'

  get 'categories/:category', to: 'articles#index', as: :tag

  resources :articles do 
    resources :comments
  end

  resources :categories do 
    resources :type_categories
  end


  
  root to: 'home#index'

  


end
