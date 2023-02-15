class UsersController < ApplicationController
  def show
    @recipes = Recipe.where(user_id: params[:id])
  end
end
