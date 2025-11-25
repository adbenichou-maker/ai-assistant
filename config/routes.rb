Rails.application.routes.draw do
  root to: "pages#home"
  # Recipes
  get    "/recipes",     to: "recipes#index"
  get    "/recipes/:id", to: "recipes#show"
  delete "/recipes/:id", to: "recipes#destroy"

end
