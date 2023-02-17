Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"

  # get "/public_recipes", to: 'public_recipes#index'
  # get "/public_recipes/:id", to: 'public_recipes#show'
  
  resources :recipes, only: [:index, :new, :show, :create] do 
    resources :recipe_foods, only: [:new, :create, :destroy]  
  end
  resources :foods, only: [:index, :new, :show, :create]
  resources :shopping_lists, only: [:index, :show]
end
