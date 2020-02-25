Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: [:index, :show,:destroy]
  resources :bookings, only: [:new, :create, :edit, :update, :show] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :cinemas do
    resources :movies, only: [:new, :create] do
      resources :movie_sessions, only: [:new, :create, :edit, :update]
    end
  end
  get "dashboard", to: 'pages#dashboard', as: 'dashboard'
  get "cancelled", to: 'bookings#cancelled', as: "cancelled"
end
