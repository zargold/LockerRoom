Rails.application.routes.draw do
  
  root  "static_pages#home"
  get   "sessions/new"
  get   "/contact" => "static_pages#contact"
  get    "/about"  => "static_pages#about"
  get    "/help"   => "static_pages#help"
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"
  resources           :users 
  resources           :exercises
  
  resources           :users do
    resources         :goals
  end
  
  resources           :goals do
    resources         :workouts
  end
  resources           :workouts
end
