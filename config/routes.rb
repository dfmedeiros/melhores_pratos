MelhoresPratos::Application.routes.draw do
  namespace :panel do
    resources :restaurants
  end

  devise_for :users

  root to: 'site#home'
end
