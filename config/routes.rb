AuthForum::Engine.routes.draw do
  #devise_for :admin_users, class_name: "AuthForum::AdminUser"
  ActiveAdmin.routes(self)
  resources :line_items
  resources :orders do
    member do
      get 'details'
    end
  end

  resources :carts do
    member do
      get 'checkout'
    end
  end

  resources :categories

  resources :products
  resources :events

  root 'welcome#index'
  post 'user_authentication', to: 'welcome#user_authentication', as: :user_authentication

  resources :posts
  devise_for :users, module: :devise
  mount Forem::Engine, :at => '/forums'
end
