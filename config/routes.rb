Rails.application.routes.draw do
  root :to => 'store#index', :via => :get
  match 'store/:id'=> 'store#show', :as => :store_product, :via => :get
  # get 'store/index'
  # get 'store/show'
  resources :coffees
  get 'coffee_types/index'
  get 'coffee_types/show'
  resources :coffee_types
  resources :beans
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
