Rails.application.routes.draw do
  get 'admin_panel/new'
  get 'admin_panel/create'
  resources :favorite_shops
  resources :favorite_items
  resources :items
  resources :shops
  resources :admin_panel
  resources :admin_panel_unapprove
  resources :admin_panel_unsuspend
  root 'pages#home'
  devise_for :users


  resources :shops do
    put :add_to_favorite, on: :member
    put :set_approve, on: :member
    put :set_suspend, on: :member
    put :set_unsuspend, on: :member
  end
  resources :items do
    put :add_to_favorite, on: :member
  end
end
