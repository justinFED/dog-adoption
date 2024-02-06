Rails.application.routes.draw do
  devise_for :users

  # Custom route for showing individual dogs
  get 'dogs/show/:id', to: 'dogs#show', as: :show_dog

  # Resourceful route for dogs
  resources :dogs, only: [:show]

  # Root path set to landing page
  root 'pages#index', as: :landing_page

  # Custom route for adoption listing viewing
  get 'pages/show' => 'pages#show', as: :adoption_listing_viewing

  # Admin dashboard routes
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users
  end

  namespace :user do
    resources :dashboard, only: [:index]
  end
  
end
