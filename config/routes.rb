Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  get 'messages/create'
  get 'matches/index'
  get 'matches/show'
  get 'swipes/index'
  get 'swipes/create'
devise_for :users

resources :swipes, only: [:create]
resources :matches, only: [:index, :show] do
  resources :messages, only: [:create]
end

root "swipes#index"

resource :profile, only: [:edit, :update], controller: "users"
end

