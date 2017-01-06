Rails.application.routes.draw do
  resources :role_users
  get 'welcome/index', as: :index 
  get 'welcome/insufficient_privileges', as: :ip

  resources :roles
  resources :user_sessions
  resources :users do
    member do
      get :activate
    end
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
