Rails.application.routes.draw do
  resources :fights

  resources :monsters do
    get "items/new" => "monsters/items#new", as: "new_item"
    get "items/:id" => "monsters/items#show", as: "item"
    get "items/:id/edit" => "monsters/items#edit", as: "edit_item"
    delete "items/:id" => "monsters/items#destroy"
    patch "items/:id" => "monsters/items#update"
    put "items/:id" => "monsters/items#update"
    post "items" => "monsters/items#create", as: "items"
  end

  resources :abilities

  resources :professions

  resources :characters do
    get "items/new" => "characters/items#new", as: "new_item"
    get "items/:id" => "characters/items#show", as: "item"
    get "items/:id/edit" => "characters/items#edit", as: "edit_item"
    delete "items/:id" => "characters/items#destroy"
    patch "items/:id" => "characters/items#update"
    put "items/:id" => "characters/items#update"
    post "items" => "characters/items#create", as: "items"
    get "items/:id/take" => "characters/items#take", as: "take"
    get "items/:id/give" => "characters/items#give", as: "give"
    get "items/:id/equip" => "characters/items#equip", as: "equip"
    get "items/:id/unequip" => "characters/items#unequip", as: "unequip"

  end

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
  resources :users do
    get "items/:id/sell" => "users/items#sell", on: :collection, as: "sell"
    delete "items/:id" => "users/items#destroy", on: :collection, as: "destroy_item"

  end
end
