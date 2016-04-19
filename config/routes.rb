Rails.application.routes.draw do
  root to: "home#index"
  post "/", to: "home#index"

  get "auth/facebook", as: "facebook_login"
end
