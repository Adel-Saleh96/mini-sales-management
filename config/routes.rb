Rails.application.routes.draw do
  namespace :admin do
      resources :invoices
      resources :invoice_items
      resources :products
      resources :sales
      resources :suppliers
      resources :users

      root to: "invoices#index"
    end
  devise_for :users, controllers: { registrations: 'registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  get 'pages/about'
  post 'users/sign_in', to: 'users#sign_in'
end
