Rails.application.routes.draw do
  root to: "home#index"

  post "/results", to: "home#index"
  # post "/results", to: "users#update"

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "logout", to: "sessions#destroy"
end
