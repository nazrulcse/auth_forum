AuthForum::Engine.routes.draw do
  resources :line_items

  resources :carts do
    member do
      get 'checkout'
    end
  end

  resources :categories

  resources :products

  root 'welcome#index'
  ActiveAdmin.routes(self)
  resources :posts
  devise_for :users, module: :devise
  mount Forem::Engine, :at => '/forums'
end
