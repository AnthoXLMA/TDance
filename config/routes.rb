Rails.application.routes.draw do
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

