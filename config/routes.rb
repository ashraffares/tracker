Rails.application.routes.draw do
  root 'user#index'
  resources :items do
    get "external"
  end
  resources :groups
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
