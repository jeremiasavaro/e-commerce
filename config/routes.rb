Rails.application.routes.draw do
  resources :vehicles

  get  'admin/login',  to: 'sessions#new'
  post 'admin/login',  to: 'sessions#create'
  delete 'admin/logout', to: 'sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "static_pages#home"
end
