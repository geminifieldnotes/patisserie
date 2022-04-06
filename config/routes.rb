Rails.application.routes.draw do
  get 'coffee_types/index'
  get 'coffee_types/show'
  resources :coffee_types
  resources :beans
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
