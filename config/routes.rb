Rails.application.routes.draw do
  resources :inventories
  resources :ingredients
  resources :recipes
  resources :users
  resource :session, only: [:index, :create]
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
