class User::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  

  def listings
    # Fetch the necessary data for the view
    @adoptions = Dog.where(isActive: true)
    @listing = nil
  end
end
