MelhoresPratos::Application.routes.draw do
  namespace :panel do
    resources :restaurants do
      resources :foods
      resources :menu_categories
    end
  end

  resources :addresses
  resources :cities
  resources :cuisines

  devise_for :users

  root to: 'site#home'
end
