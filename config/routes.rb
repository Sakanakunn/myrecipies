Rails.application.routes.draw do
 # get "/recipes",to: "recipes#index"
  #get "/recipes/new",to:"recipes#new",as:"new_recipe"
  #post "/recipes",to:"recipes#create"
  #get "/recipes/:id/edit", to:"recipes#edit",as: "edit_rarecipe"
  #patch "/recipes/:id",to:"recipes#update"
  #get "/recipes/id",to:"recipes#show",as: "recipe"
  #delete "/recipes/:id",to:"recipes#destroy"
  root "recipes#home"
  
  resources :recipes do
    member do
     post "like"
    end
  end
  
  resources :chefs, execept: [:new]
  
  get"/register",to:"chefs#new"
  
  get "/login",to: "logins#new"
  post "/login",to: "logins#create"
  get "/logout",to: "logins#destroy"
  
  
  #login ->new session
  #logout ->close session
  
  #post login -> create session
  
end
