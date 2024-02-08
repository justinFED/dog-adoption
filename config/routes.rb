Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  resources :dogs, only: [:index, :new, :create, :edit, :update, :destroy]

  # Resources for managing adoption requests
  resources :adoption_requests, only: [:index, :new, :create]
  # Custom routes for dog-related API endpoints
  get 'dogs/breeds', to: 'dogs#breeds', as: 'breeds'
  get 'dogs/image/:image_id', to: 'dogs#image_details', as: 'image_details'
  
  # Route for viewing temperament of a specific breed
  get 'breeds/:breed_name/temperament', to: 'dogs#temperament', as: :breed_temperament

  # Set the root path to the landing page
  # Remove the session route and set the root path to the landing page
  # Custom route for showing individual dogs
  get 'dogs/show/:id', to: 'dogs#show', as: :show_dog

  # Resourceful route for dogs
  resources :dogs, only: [:show]

  # User routes
  namespace :user do
    resources :dashboard, only: [:index] do
      # Define listings action under the dashboard namespace
      get 'listings', on: :collection
    end
  end
  

  # Root path set to landing page
  root 'pages#index', as: :landing_page

  # Custom route for adoption listing viewing
  get 'pages/show', to: 'pages#show', as: :adoption_listing_viewing
  
  # Admin dashboard routes
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users
  end

  # User dashboard routes
  namespace :user do
    resources :dashboard, only: [:index] do
      get 'listings', on: :collection
    end
  end
end
