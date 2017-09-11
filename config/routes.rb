Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :colors
  resources :brands, only: [:index, :create, :show, :new, :destroy]
  resources :types
end
