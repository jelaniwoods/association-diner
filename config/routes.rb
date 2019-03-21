Rails.application.routes.draw do
  root "levels#index"
  resources :queries
  resources :answers
  resources :levels
  post "levels/:id", to: 'levels#store'
  get "levels/:id/results", to: 'levels#results', as: "level_results"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
