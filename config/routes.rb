Rails.application.routes.draw do
  
  resources :line_items
  
  resources :categories do 
    resources :items 
  end
  
  resources :carts
  resources :items 
  resources :orders
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    resources :carts
  end
  
  root 'store#index' #, as: 'store'
  
  post '/orders' => 'orders#create', as: 'create_order'
  
  #Admin Routes
  resources :admin, only: [:index]
  get '/items_index' => 'admin#items', as: 'admin_items'
  get '/orders_index' => 'admin#orders', as: 'admin_orders'
  get '/show_order/:id' => 'admin#show_order'
  get '/admin_order/:id' => 'orders#admin_order'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
