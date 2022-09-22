Rails.application.routes.draw do
  resources :tags
  resources :spots
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' }
  # get 'users/:id' => "users#show"
  resources :users, only: %i[index show destroy]
  resources :albums
  root 'albums#index'
end
