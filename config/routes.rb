# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  # Role choice route
  resource :role_choice, only: [:index, :update]

  # Other routes
  resources :admin_dashboard do 
    collection do 
      get :user_list 
    end
  end

  namespace :trader do
    get 'dashboard', to: 'dashboard#index'
  end

  resources :users, only: [:index, :new, :create, :show, :edit, :update]

  root to: 'home#index'
end
