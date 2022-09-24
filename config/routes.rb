Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :groups do
      resources :entities
    end
  end

  root to: "pages#home"
end
