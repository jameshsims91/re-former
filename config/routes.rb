Rails.application.routes.draw do
  resources :users, only: [ :new, :create ]
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"
end
