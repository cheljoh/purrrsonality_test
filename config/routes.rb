Rails.application.routes.draw do
  root to: "home#index"
  post "/", to: "home#index"

  # get "auth/facebook", as: "facebook_login"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "logout", to: "sessions#destroy"
end
