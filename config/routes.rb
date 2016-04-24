Rails.application.routes.draw do
  root to: "home#index"
  post "/", to: "home#index"

  resources :users, only: [:show]

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "logout", to: "sessions#destroy"
end
