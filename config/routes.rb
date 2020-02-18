Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: [:index, :show,:destroy]
  resources :cinemas do
    resources :movies, only: [:new, :create] do
      resources :movie_sessions, only: [:new, :create, :edit, :update] do
        resources :bookings, only: [:new,:create]
      end
    end
  end
  get "dashboard", to: 'pages#dashboard', as: 'dashboard'
end
