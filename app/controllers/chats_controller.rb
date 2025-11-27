require 'ostruct'

class ChatsController < ApplicationController
  before_action :set_chat, only: [:show]
  before_action :authenticate_user!

  SYSTEM_PROMPT = <<~PROMPT
    You are an expert chef and cooking assistant.

    The user just gave you his conditions that you need to respect:
    - ingredients available in their fridge: #{@ingredients}
    - dietary preferences:  #{@restrictions}
    - cooking time constraints in minutes:  #{@meal_prep_time}
    - their skill level:  #{@skill_level}

    Your job:
    - First suggest 3 possible recipes only displaying the title, short desription and list of ingredients
    - Each recipe should be adapted to the ingredients they have
    - If ingredients are missing, propose simple alternatives
    - Keep instructions simple and beginner-friendly
    - At the end of this first message ask the user to chose one recipe in particular, to detail the recipe in the second message

    Format at first:
    - Use Markdown
    - For each recipe:
      - Propose 3 recipe
      - A title
      - Short description
      - List of ingredients needed
      - Preparation time
    Format once the user has selected a recipe:
    - Use Markdown
    - For each recipe:
      - A title
      - List of ingredients needed
      - Step-by-step instructions
      - Cooking tips when relevant

    Tone: friendly, helpful, educational.
  PROMPT


  def index
  end

  def new
    @chat = Chat.new()

    @recipe_requirements = {
      ingredients: nil,
      skill_level: 'Beginner',
      meal_type: 'Dinner',
      meal_prep_time: nil,
      restrictions: nil
    }
  end

  def create
    # Récupérer les paramètres autorisés (y compris le hash imbriqué)
    recipe_requirements = chat_params[:recipe_requirements]
    # Accéder aux ingrédients (vous pouvez les utiliser pour générer le premier message/prompt)
    @ingredients = recipe_requirements[:ingredients]
    @skill_level = recipe_requirements[:skill_level]
    @meal_type = recipe_requirements[:meal_type]
    @meal_prep_time = recipe_requirements[:meal_prep_time]
    @restrictions = recipe_requirements[:restrictions]

    # Créer le Chat

    @chat = Chat.new(user: current_user, title: recipe_requirements[:ingredients])

    # ... logique de création de message et LLM ici ...

    if @chat.save
      user_prompt = "My ingredients are: #{recipe_requirements[:ingredients]}, my skill level is: #{recipe_requirements[:skill_level]}, I have #{recipe_requirements[:meal_prep_time]} min to prepare it, my food restriction are: #{recipe_requirements[:restrictions]}"

          # 2. Enregistrer le message de l'utilisateur (pour l'historique)
          Message.create!(
            chat: @chat,
            role: "user",
            content: user_prompt
          )

          # 3. Préparer le contexte (System Prompt + Nouveau Message Utilisateur)
          # NOTE: Les variables d'instance (@ingredients, etc.) ne fonctionnent pas
          # dans la constante SYSTEM_PROMPT. Il faut passer les valeurs dans la prompt de l'utilisateur.
          llm_messages = [
            { role: "system", content: SYSTEM_PROMPT },
            { role: "user", content: user_prompt }
          ]

          # 4. Appeler l'IA
          # Assurez-vous que RubyLLM est bien configuré (clé API et modèle)
          response = RubyLLM.chat.ask(llm_messages)

          # 5. Sauvegarder la réponse de l'assistant
          Message.create!(
            chat: @chat,
            role: "assistant",
            content: response.content
          )

          # 6. Rediriger (UNE SEULE FOIS)
          redirect_to chat_path(@chat)
    else
      # Gérer l'erreur
      render :new, status: :unprocessable_entity
    end

  end


  def show
    # A blank Message object for the new-message form
    @message = Message.new
  end

  private

  def set_chat
    @chat = current_user.chats.find(params[:id])
  end


  def chat_params
  # 1. Requérir la clé principale :chat
  params.require(:chat).permit(
    # 2. Permettre les autres attributs directs du Chat si besoin (ex: title)
    :title,

    # 3. Permettre le hash imbriqué :recipe_requirements
    #    et lister toutes ses sous-clés autorisées (Strong Parameters)
    recipe_requirements: [
      :cuisine,
      :ingredients,
      :skill_level,
      :meal_type,
      :meal_prep_time,
      :restrictions
    ]
  )
  end

end
