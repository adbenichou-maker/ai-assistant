class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @message = Message.find(params[:message_id])
    @recipe = Recipe.new
  end

def create
  @message = Message.find(params[:message_id])
  @recipe = Recipe.new(recipe_params)
  @recipe.message = @message

  @recipe.content = @message.content

  @recipe.save

  if @recipe.save
    chat = @message.chat
    redirect_to chat_path(chat), notice: "Recette sauvegardée !"
  else
    @message = @recipe.message
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
    params.require(:recipe).permit(:title, :content, :comment, :message_id)
    # Ajoutez tous les attributs de Recipe qui peuvent être modifiés par le formulaire
  end

end
