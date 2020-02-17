Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

  get 'home/index'

  #get 'categories/:category_id', to: 'articles#index', as: :category

  resources :articles do 
    resources :comments
  end

  resources :verifieds do
    resources :users
    resources :articles
  end

 




  
  root to: 'home#index'

  


end
