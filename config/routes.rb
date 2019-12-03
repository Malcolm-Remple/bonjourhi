Rails.application.routes.draw do
  get 'vocab_items/index'
  get 'vocab_items/show'
  get 'vocab_items/new'
  get 'vocab_items/create'
  get 'vocab_items/edit'
  get 'vocab_items/update'
  get 'vocab_items/destroy'
  get 'vocab_items_controller/index'
  get 'vocab_items_controller/show'
  get 'vocab_items_controller/new'
  get 'vocab_items_controller/create'
  get 'vocab_items_controller/edit'
  get 'vocab_items_controller/update'
  get 'vocab_items_controller/destroy'
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

  get '/meetups/callback', to: 'meetups#new_event', as: 'new_event'

  resources :meetups, only: [:index, :show, :update] do
    get '/events', to: 'meetups#get_token', as: 'get_token'
    # get '/callback', to: 'meetups#new_event', as: 'new_event'
  end

  resources :vocab_lists do
    resources :vocab_items
  end

  # for user account page
  get '/my_account', to: "users#account_show", as: 'my_account'
  patch '/my_account', to: "users#account_update"

  get '/style', to: "pages#style"
end
