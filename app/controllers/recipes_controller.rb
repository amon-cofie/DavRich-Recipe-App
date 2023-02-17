class RecipesController < ApplicationController
    before_action :authenticate_user!, except: [:show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'recipe added successfully'
    else
      render new, alert: 'sorry an error happened. try again'
    end
  end

  def show
    @recipes = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes(:food)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, alert: 'Recipe has been deleted'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
