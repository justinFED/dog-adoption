Rails.application.routes.draw do
  devise_for :users


  # API endpoints
  get 'dogs/breeds', to: 'dogs#breeds', as: 'breeds'
  get 'dogs/image/:image_id', to: 'dogs#image_details', as: 'image_details'
  resources :dogs, only: [:show]

  # Remove the session route and set the root path to the landing page
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
