Rails.application.routes.draw do

  resources :ingredients

  resources :users do
    resources :recipes
    resources :inventories
  end
  resource :session, only: [:index, :create]
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
