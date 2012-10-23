CalcIt::Application.routes.draw do
  
	root :to => 'home#index'
	
  match 'users/index' => 'users#index', :as => 'users_index'
	
	devise_for :users

  ActiveAdmin.routes(self) rescue nil
  devise_for :admin_users, ActiveAdmin::Devise.config

end
