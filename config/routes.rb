MelhoresPratos::Application.routes.draw do
  namespace :panel do
    resources :restaurants
  end

  resources :addresses

  devise_for :users

  root to: 'site#home'
end
