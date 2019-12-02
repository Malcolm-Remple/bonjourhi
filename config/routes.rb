Rails.application.routes.draw do
  get 'vocab_items/index'
  get 'vocab_items/show'
  get 'vocab_items/new'
  get 'vocab_items/create'
  get 'vocab_items/edit'
  get 'vocab_items/update'
  get 'vocab_items/delete'
  get 'vocab_lists/index'
  get 'vocab_lists/show'
  get 'vocab_lists/new'
  get 'vocab_lists/create'
  get 'vocab_lists/edit'
  get 'vocab_lists/update'
  get 'vocab_lists/delete'
  # for chat
  mount ActionCable.server => '/cable'

  get 'user_languages/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update] do
    resources :meetups, only: [:new, :create]
    resources :chats, only: [:index, :show, :create]
  end

  # for chat
  resources :messages, only:[:create]

  resources :user_languages, only: [:edit, :update, :new, :create, :destroy]
  resources :meetups, only: [:index, :show, :update]

  resources :vocab_lists do
    resources :vocab_items
  end
  # for user account page
  get '/my_account', to: "users#account_show", as: 'my_account'
  patch '/my_account', to: "users#account_update"

  get '/style', to: "pages#style"
end
