NativetongueWebsite::Application.routes.draw do
  match '/app-consulting' => 'home#app_consulting', :as => 'consulting'
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end