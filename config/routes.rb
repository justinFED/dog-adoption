Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

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
