Rails.application.routes.draw do
  get 'meetups/index'
  get 'meetups/new'
  get 'meetups/create'
  get 'meetups/show'
  get 'meetups/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update] do
    resources :meetups, only: [:new, :create]    
  end
  
  resources :meetups, only: [:index, :show, :update]
end
