Rails.application.routes.draw do
  resources :favorite_shops
  resources :favorite_items
  resources :items
  resources :shops
  root 'pages#home'
  devise_for :users


  resources :shops do
    put :add_to_favorite, on: :member
  end
  resources :items do
    put :add_to_favorite, on: :member
  end
end
