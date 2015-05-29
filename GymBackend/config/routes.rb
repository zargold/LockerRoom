Rails.application.routes.draw do
  get   "sessions/new"
  root  "static_pages#home"
  get   "/contact" => "static_pages#contact"
  get    "/about" => "static_pages#about"
  get    "/help" => "static_pages#help"
  get    "login" => "sessions#new"
  post   "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "/users/:id/goals/:goal_id/" => "goals#goalbyName"
  resources :users 
  resources :goals
  resources :exercises
  resources :workouts
end
