Rails.application.routes.draw do
  resources :queries
  resources :answers
  resources :levels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
