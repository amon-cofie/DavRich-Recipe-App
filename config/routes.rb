Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "public_recipes#index"

  
  resources :recipes, only: [:index, :new, :show, :create] do 
    resources :recipe_foods, only: [:new, :create, :destroy]  
  end
  resources :foods, only: [:index, :new, :show, :create]
  resources :shopping_lists, only: [:index]
  resources :public_recipes, only: [:index]
end
