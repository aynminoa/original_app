Rails.application.routes.draw do
  root 'homes#index'
  resources :favorites, only: %i[create destroy]
  resources :tags
  resources :spots
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' }
  # get 'users/:id' => "users#show"
  resources :users, only: %i[index show destroy]
  resources :albums
end
