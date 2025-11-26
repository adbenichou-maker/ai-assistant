require 'ostruct'

class ChatsController < ApplicationController



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
    puts @chat
  end


end
