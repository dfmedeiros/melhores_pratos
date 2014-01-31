MelhoresPratos::Application.routes.draw do
  namespace :panel do
    resources :restaurants do
      resources :foods
    end
  end

  resources :addresses
  resources :cities

  devise_for :users

  root to: 'site#home'
end
