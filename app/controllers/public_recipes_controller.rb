class PublicRecipes < ApplicationController
    def index
        @public_recipes = Recipe.where(:public = true)
    end

    def show
        @recipe = Recipe.where(:id = params[:id])    
    end
end