Rails.application.routes.draw do

  resources :ingredients
  resources :users do
    resources :recipes
  end
  resource :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'
  resources :recipes
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
