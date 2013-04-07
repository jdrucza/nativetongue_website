NativetongueWebsite::Application.routes.draw do
  resources :enquiries

  match '/robots.txt' => 'home#robots'

  match '/app-consulting' => 'home#app_consulting', :as => 'consulting'
  match '/letterpress-game-strategy-guide' => 'home#lp_strategy', as: 'lp_strategy'
  match '/' => 'home#app_consulting', :constraints => {:subdomain => 'apps'}
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end