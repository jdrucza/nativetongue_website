NativetongueWebsite::Application.routes.draw do
  resources :enquiries


  match '/app-consulting' => 'home#app_consulting', :as => 'consulting'
  match '/' => 'home#app_consulting', :constraints => {:subdomain => 'apps'}
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end