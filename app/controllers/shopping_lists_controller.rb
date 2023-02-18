class ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_ingredients = RecipeFood.includes(:recipe, :food)
    @missing = @all_ingredients.select { |ing| ing.quantity > ing.food.quantity }
    @missing_ingredients = @missing.map do |ingredient|
      {
        name: ingredient.food.name,
        quantity: ingredient.quantity - ingredient.food.quantity,
        price: ingredient.food.price * (ingredient.quantity - ingredient.food.quantity)
      }
    end
    @total_price = @missing_ingredients.map { |ing| ing[:price] }.sum
  end
end
