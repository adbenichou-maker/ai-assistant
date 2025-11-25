require 'ostruct'

class ChatsController < ApplicationController



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

  def create
  end


end
