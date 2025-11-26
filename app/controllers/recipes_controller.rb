class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: "#{@recipe.title} was successfully deleted."
  end
end
