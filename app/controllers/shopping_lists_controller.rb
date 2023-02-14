class ShoppingListsController < ApplicationController
  def index
    @all_ingredients = RecipeFood.includes(:recipes, :foods)
    @missing = @all_ingredients.select { |ing| ing.quantity > ing.foods.quantity }
    @missing_ingredients = missing.map do |ingredient|
      {
        name: ingredient.foods.name,
        quantity: ingredient.quantity - ingredient.foods.quantity,
        price: ingredient.foods.price * (ingredient.quantity - ingredient.foods.quantity)
      }
    end
    @total_price = @missing_ingredients.map { |ing| ing[:price] }.sum
  end
end
