Rails.application.routes.draw do
  resources :pastry_types
  resources :pastries

  get 'menu/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => 'store#index', :via => :get
  match 'store/:id'=> 'store#show', :as => :store_product, :via => :get
  # get 'store/index'
  # get 'store/show'
  resources :coffees
  get 'coffee_types/index'
  get 'coffee_types/show'
  resources :coffee_types
  resources :beans

  post 'cart/add/:id', to: 'cart#add', as: 'add_to_cart'
  delete 'cart/remove/:id', to:'cart#remove', as: 'delete_from_cart'
end
