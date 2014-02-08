MelhoresPratos::Application.routes.draw do
  namespace :panel do
    resources :restaurants do
      member do
        post :publish
      end
      resources :foods
      resources :menu_categories
    end
  end

  resources :cities
  resources :cuisines

  devise_for :users

  root to: 'site#home'
end
