Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: [:index, :show, :new, :create, :destroy]
  resources :movie_sessions, :only => [] do
    resources :bookings, only: [:new,:create]
  end
  # For details o the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
