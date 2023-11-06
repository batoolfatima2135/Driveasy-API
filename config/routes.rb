Rails.application.routes.draw do
  resources :reservations, only: [:index, :show,:create, :destroy]
  resources :cars, only: [:index, :create, :show, :destroy]

  resources :users, only: [:create]
end
