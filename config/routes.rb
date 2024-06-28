Rails.application.routes.draw do
  #devise_for :users # Si usas Devise para autenticación

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, only: [:index, :create, :update, :destroy]
      resources :experiences, only: [:index, :create, :update, :destroy]
      resources :studies, only: [:index, :create, :update, :destroy]
      resources :contacts, only: [:create]
      resources :skills, only: [:index, :create, :update, :destroy]
    end
  end

  root 'pages#home'
  get 'pages/about'
  # Otras rutas para páginas estáticas si las necesitas
end