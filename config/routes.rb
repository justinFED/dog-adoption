Rails.application.routes.draw do
  devise_for :users

  # Custom route for showing individual dogs
  get 'dogs/show/:id', to: 'dogs#show', as: :show_dog

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

  # API endpoints
  get 'dogs/breeds', to: 'dogs#breeds', as: 'breeds'
  get 'dogs/image/:image_id', to: 'dogs#image_details', as: 'image_details'
  resources :dogs, only: [:show]

  # Admin dashboard routes
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users
  end
end
