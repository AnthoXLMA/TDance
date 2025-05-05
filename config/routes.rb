Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
# config/routes.rb

# Routes de Devise
devise_for :users

resources :swipes, only: [:create]
resources :matches, only: [:index, :show] do
  resources :messages, only: [:create]
end

root "swipes#index"

# Profile route (par exemple, si tu veux personnaliser les actions)
resource :profile, only: [:edit, :update], controller: "users"


end

