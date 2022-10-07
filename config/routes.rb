Rails.application.routes.draw do
  root 'homes#index'
  resources :favorites, only: %i[index create destroy]
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' }
    
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
      post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
    end  
    
    resources :groups do
      resources :users
      resources :albums
    end
    
    resources :users, only: %i[index show destroy]
    resources :albums
    resources :spots
    resources :tags
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
