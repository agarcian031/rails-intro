Rails.application.routes.draw do

  root "static_pages#home" #will make index page to be the root
  get "/about", to: "static_pages#about"

  resources :pages #will create all CRUD actions 
end
