Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

  get 'home/index'

  resources :articles do 
    resources :comments
  end


  
  root to: 'home#index'



end
