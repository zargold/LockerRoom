Rails.application.routes.draw do



  root "static_pages#home"
  get "/contact" => "static_pages#contact"
  get "/about" => "static_pages#about"
  get "/help" => "static_pages#help"
  resources :users
  resources :goals
end
