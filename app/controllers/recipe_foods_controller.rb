class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_new = @recipe.recipe_foods.new
    @foods = Food.all
  end

  def create
    @recipe_foods = RecipeFood.new(recipe_foods_params)
    if @recipe_foods.save
      redirect_to recipe_path(params[:recipe_id])
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
