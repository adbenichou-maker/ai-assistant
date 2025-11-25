require 'ostruct'

class ChatsController < ApplicationController

  def index
  end

  def new
    @chat = Chat.new()

    @recipe_requirements = {
      cuisine: nil,
      ingredients: nil,
      skill_level: 'Beginner',
      meal_type: 'Dinner',
      meal_prep_time: nil,
      restrictions: nil
    }
  end

  before_action :set_chat, only: [:show]
  before_action :authenticate_user!

  SYSTEM_PROMPT = <<~PROMPT
    You are an expert chef and cooking assistant.

    The user will give you:
    - ingredients available in their fridge
    - dietary preferences
    - cooking time constraints
    - kitchen equipment available

    Your job:
    - Suggest 3 possible recipes
    - Each recipe should be adapted to the ingredients they have
    - If ingredients are missing, propose simple alternatives
    - Keep instructions simple and beginner-friendly

    Format:
    - Use Markdown
    - For each recipe:
      - A title
      - Short description
      - List of ingredients needed
      - Step-by-step instructions

    Tone: friendly, helpful, educational.
  PROMPT

  def show
    # A blank Message object for the new-message form
    @message = Message.new
  end

  private

  def set_chat
    @chat = current_user.chats.find(params[:id])
  end

end
