Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :dogs, only: [:index, :new, :create, :edit, :update, :destroy]

  # API endpoints
  get 'dogs/breeds', to: 'dogs#breeds', as: 'breeds'
  get 'dogs/image/:image_id', to: 'dogs#image_details', as: 'image_details'
  get 'breeds/:breed_name/temperament', to: 'breeds#temperament', as: :breed_temperament

  resources :breeds do
    get 'temperament', on: :member
  end
  
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
end
