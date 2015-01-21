Rails.application.routes.draw do
  resources :fights

  resources :monsters

  resources :abilities

  resources :professions

  resources :characters

  resources :merchants do
    get "items/new" => "merchants/items#new", as: "new_item"
    get "items/:id" => "merchants/items#show", as: "item"
    get "items/:id/edit" => "merchants/items#edit", as: "edit_item"
    delete "items/:id" => "merchants/items#destroy"
    patch "items/:id" => "merchants/items#update"
    put "items/:id" => "merchants/items#update"
    post "items" => "merchants/items#create", as: "items"
    get "items/:id/buy" => "merchants/items#buy", as: "buy_item"
  end

    resources :items

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
