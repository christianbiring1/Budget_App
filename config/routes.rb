Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :groups
    resources :entities
  end
  # root to: "users#index"
  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
