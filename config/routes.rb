AuthForum::Engine.routes.draw do
  devise_for :admin_users, class_name: 'AuthForum::AdminUser', module: :devise
  resources :line_items
  resources :orders do
    member do
      get 'details'
    end
  end

  resources :carts do
    member do
      get 'empty_cart'
    end
  end

  resources :categories

  resources :products do
    collection do
      get 'more'
    end
  end
  resources :events do
    collection do
      get 'more'
    end
  end

  root 'welcome#index'
  post 'user_authentication', to: 'welcome#user_authentication', as: :user_authentication

  resources :posts
  devise_for :users, module: :devise
  mount Forem::Engine, :at => '/forums'
end
