class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @message = Message.find(params[:message_id])
    @recipe = Recipe.new(message: @message)
  end

  def create
    @message = Message.find(params[:message_id])

    # 2. Créer la Recipe en utilisant les Strong Parameters et l'association
    @recipe = Recipe.new(recipe_params)
    @recipe.message = @message

    # Si vous voulez copier le contenu du message de l'IA dans la recette
    # @recipe.content = @message.content

    if @recipe.save
      # 3. Rediriger vers la page du chat parent (@chat doit être récupéré via @message)
      redirect_to chat_path(@message.chat), notice: "Recette sauvegardée !"
    else
      # Recharger le message pour la vue :new en cas d'erreur de validation
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
    params.require(:recipe).permit(:title, :content, :notes)
    # Ajoutez tous les attributs de Recipe qui peuvent être modifiés par le formulaire
  end

end
