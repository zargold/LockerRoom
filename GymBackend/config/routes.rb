Rails.application.routes.draw do
  get 'exercises/new'

  get 'exercises/show'

  get 'exercises/edit'

  get 'exercises/index'

  get 'goals/index'

  get 'goals/new'

  get 'goals/show'

  get 'goals/edit'

  root "static_pages#home"
  get "/contact" => "static_pages#contact"
  get "/about" => "static_pages#about"
  get "/help" => "static_pages#help"
  resources :users
end
