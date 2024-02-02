Rails.application.routes.draw do
  devise_for :users

  # Remove the session route and set the root path to the landing page
  root 'pages#index'

  # Add other routes if needed

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
