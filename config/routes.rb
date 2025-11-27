Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Static Pages
  get "/landing",   to: "pages#landing"
  get "/dashboard", to: "pages#dashboard"

  # Devise
  # devise_for :users

  # Chats
  # get  "/chats",          to: "chats#index"
  # get  "/chats/new",      to: "chats#new"
  # get  "/chats/:id",      to: "chats#show"
  # post "/chats",          to: "chats#create"

  resources :chats, only: [:index, :new, :show, :create] do
    resources :messages, only: [:create]
  end


  # Messages inside a chat
  #  post "/chat/:id/messages", to: "chats#create"

  # Recipes
  # get    "/recipes",     to: "recipes#index"
  # get    "/recipes/:id", to: "recipes#show"
  # delete "/recipes/:id", to: "recipes#destroy"

  resources :recipes, only: [:index, :destroy, :show]

  resources :messages, only: [] do
    resources :recipes, only: [:new, :create]
  end
end
