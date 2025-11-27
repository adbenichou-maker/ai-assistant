class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_recipes
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end


  private

  def set_recipes
    @recipes = current_user&.recipes
  end
end
