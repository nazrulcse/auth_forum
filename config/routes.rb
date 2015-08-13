AuthForum::Engine.routes.draw do
  #devise_for :admin_users, class_name: "AuthForum::AdminUser"
  ActiveAdmin.routes(self)
  resources :line_items

  resources :carts do
    member do
      get 'checkout'
    end
  end

  resources :categories

  resources :products

  root 'welcome#index'

  resources :posts
  devise_for :users, module: :devise
  mount Forem::Engine, :at => '/forums'
end
