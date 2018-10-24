Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

  get "/login", to: 'users#new'

  get "/address", to: 'address_search#new'

  resources :users, only: [:create]
end
