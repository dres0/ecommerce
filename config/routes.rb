Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  get 'home/index'
  root to: "home#index"
  authenticate :admin do
    resources :categories
  end

  resources :products

  #La ruta del carrito con sus acciones
  resource :cart, only: [:show, :update]
end
