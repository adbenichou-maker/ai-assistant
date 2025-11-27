class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @message = Message.find(params[:message_id])
    @recipe = Recipe.new
  end

def create
  @message = Message.find(params[:message_id])
  @recipe = Recipe.new(recipe_params)
  @recipe.user = current_user
  @recipe.message = @message

  @recipe.content = @message.content

  @recipe.save

  if @recipe.save
    redirect_to recipes_path, notice: "Recette sauvegardée !"
  else
    @message = Message.find(params[:message_id])
    render :new, status: :unprocessable_entity


  end
end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: "#{@recipe.title} was successfully deleted."
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :comment)
    # Ajoutez tous les attributs de Recipe qui peuvent être modifiés par le formulaire
  end

end
