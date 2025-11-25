Rails.application.routes.draw do
  root to: "pages#home"

  # Static Pages
  get "/landing",   to: "pages#landing"
  get "/dashboard", to: "pages#dashboard"

  # Devise
  devise_for :users

  # Chats
  get  "/chats",          to: "chats#index"
  get  "/chats/:id",      to: "chats#show"
  get  "/chats/new",      to: "chats#new"
  post "/chats",          to: "chats#create"

  # Messages inside a chat
  post "/chat/:id/messages", to: "chats#create"

  # Recipes
  get    "/recipes",     to: "recipes#index"
  get    "/recipes/:id", to: "recipes#show"
  delete "/recipes/:id", to: "recipes#destroy"

end
