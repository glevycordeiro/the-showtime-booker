Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookings, only: [:new,:create]
  resources :movies, only: [:index, :show,:destroy]
  resources :bookings, only: [:new, :create, :edit, :update,:show]
  resources :cinemas do
    resources :movies, only: [:new, :create] do
      resources :movie_sessions, only: [:new, :create, :edit, :update]
    end
  end
  get "dashboard", to: 'pages#dashboard', as: 'dashboard'
end
