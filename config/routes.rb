Rails.application.routes.draw do
  resources :turns

  resources :global_monsters do
    get "items/:id/take" => "global_monsters/items#take", as: "take"
    post "items/give" => "global_monsters/items#give", as: "give"

  end

  resources :global_items

  resources :fights

  resources :monsters

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
    post "items/give" => "merchants/items#give", as: "give"
  end

  resources :items

  root to: 'visitors#index'
  devise_for :users
  resources :users do
    get "items/:id/sell" => "users/items#sell", on: :collection, as: "sell"
    delete "items/:id" => "users/items#destroy", on: :collection, as: "destroy_item"
    get "fight" => "users/fights#new_fight", on: :collection, as: "new_fight"
    post "fight/add_character" => "users/fights#add_character", on: :collection, as: "add_character"
    get "fight/:id" => "users/fights#show", as: "fight", on: :collection
    get "fight/:id/attack" => "users/fights#attack", as: "attack", on: :collection
  end
end
