AuthForum::Engine.routes.draw do
  devise_for :users, module: :devise
  root 'welcome#index'
  mount Forem::Engine, :at => '/forums'
end
