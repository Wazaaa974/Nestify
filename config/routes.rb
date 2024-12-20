Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "projectdraft", to:"pages#project_draft"
  # Defines the root path route ("/")
  # root "posts#index"

  resources :packages do
      patch :replace_product_package
  end

  resources :dashboards, only: [:index, :destroy]
  resources :user_packages, only: [:index, :new, :create, :show, :edit, :destroy]
  resources :questions, only: [:index, :create]
  resources :proposals, only: [:update, :destroy, :show]
end
