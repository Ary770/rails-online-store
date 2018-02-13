Rails.application.routes.draw do
  
  resources :line_items
  resources :categories
  resources :carts
  resources :items
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'store#index', as: 'store'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
