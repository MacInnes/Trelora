Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#new'
  post '/', to: 'sessions#create'

  get "/find", to: 'address_search#new'

  resources :users, only: [:create]
end
