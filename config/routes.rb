Rails.application.routes.draw do
  get 'user_languages/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update] do
    resources :meetups, only: [:new, :create]
  end

  resources :user_languages, only: [:edit, :update, :new, :create, :destroy]
  resources :meetups, only: [:index, :show, :update]
end
