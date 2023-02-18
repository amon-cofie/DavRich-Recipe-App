class RecipesController < ApplicationController
  # load_and_authorize_resource
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
    @recipe = Recipe.find(params[:id])
    @recipes = Recipe.includes(:recipe_foods).find(params[:id])
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
