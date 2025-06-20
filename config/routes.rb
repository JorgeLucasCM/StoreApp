Rails.application.routes.draw do
  devise_for :users

  # Rotas para Stores e Products
  resources :stores, param: :slug, only: [:new, :create, :index, :show] do
    resources :products, param: :id, only: [:new, :create, :edit, :update, :destroy, :show] do
      post 'buy', on: :member
    end
  end

  # Rota para sign_out do Devise
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  # Rota para a página inicial
  root "home#index"

  # Rota para health check
  get "up" => "rails/health#show", as: :rails_health_check
end