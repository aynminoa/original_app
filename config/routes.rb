Rails.application.routes.draw do
  resources :spots
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' }
  # get 'users/:id' => "users#show"
  resources :users, only: %i[show]
  resources :albums
  root 'albums#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
