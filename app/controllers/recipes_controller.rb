class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(name: params[:name], preparation_time: params[:preparation_time],
                         cooking_time: params[:cooking_time], description: params[:description], public: params[:public])
    @recipe.user = current_user
    if @recipe.save
      redirect_to_recipes_path, notice = 'recipe added successfully'
    else
      render new, alert = 'sorry an error happened. try again'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes(:food)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to_recipes_path, alert = 'Recipe has been deleted'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, description, :public)
  end
end
