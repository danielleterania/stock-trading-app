Rails.application.routes.draw do
  devise_for :users

  # Dashboard routes
  resources :admin_dashboard do 
    collection do 
      get :user_list 
    end
  end

  namespace :trader do
    get 'dashboard', to: 'dashboard#index'
  end

  # Resource routes for users
  resources :users, only: [:index, :new, :create, :show, :edit, :update]

  # Root route (optional, can be adjusted as needed)
  root to: 'home#index' # Replace with your home page controller if you have one
end
