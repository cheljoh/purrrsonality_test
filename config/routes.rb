Rails.application.routes.draw do
  root to: "home#index"

  get "/results", to: "users#index"
  post "/results", to: "users#update"

  get "/Colonel Meow", to: "colonel#show"
  get "/Keyboard Cat", to: "keyboard#show"
  get "/Grumpy Cat", to: "grumpy#show"
  get "/Lil Bub", to: "lilbub#show"
  get "/Newspaper Kitteh", to: "newspaper#show"
  get "/Shironeko", to: "shironeko#show"

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "logout", to: "sessions#destroy"
end
