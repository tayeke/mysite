Taylor::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'Home#index'

  get ':id', to: 'Categories#show', as: :category
  get ':category/:id', to: 'Articles#show', as: :article

end