Rails.application.routes.draw do
  resources :items
  resources :shops
  root 'pages#home'
  devise_for :users


  resources :shops do
    put :favorite, on: :member
  end
end
