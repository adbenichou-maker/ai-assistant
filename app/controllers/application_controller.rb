class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  devise_parameter_sanitizer.permit(:account_update, keys: [:username])
end

before_action :set_recipes

private

def set_recipes
  @recipes = Recipe.all
end

end
