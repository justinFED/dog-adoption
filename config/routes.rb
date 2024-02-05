Rails.application.routes.draw do
  devise_for :users


  # API endpoints
  get 'dogs/breeds', to: 'dogs#breeds', as: 'breeds'
  get 'dogs/image/:image_id', to: 'dogs#image_details', as: 'image_details'
  resources :dogs, only: [:show]

  # Remove the session route and set the root path to the landing page
  root 'pages#index', as: :landing_page

  # Add other routes if needed

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'pages/show' => 'pages#show', as: :adoption_listing_viewing
  get "up" => "rails/health#show", as: :rails_health_check
end
