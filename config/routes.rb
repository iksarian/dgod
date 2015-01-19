Rails.application.routes.draw do
  resources :monsters

  resources :abilities

  resources :professions

  resources :characters

  resources :merchants

  resources :items

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
