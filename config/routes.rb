CalcIt::Application.routes.draw do

  root :to => 'home#index'

  match 'users/index' => 'users#index', :as => 'users_index'

  resources :transactions, :except => [:show]
  resources :transaction_imports, :only => [:new, :create, :destroy]

  match 'transaction_imports/destroy' => 'transaction_imports#destroy', :as => 'delete_last_bulk_upload'
  devise_for :users

  ActiveAdmin.routes(self) rescue nil
  devise_for :admin_users, ActiveAdmin::Devise.config

end
