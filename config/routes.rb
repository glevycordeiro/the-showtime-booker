Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: [:index, :show]
  resources :cinemas do
    resources :movies, only: [:create, :edit, :update, :destroy]
  end
  get "dashboard", to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
