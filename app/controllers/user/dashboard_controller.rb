class User::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def listings
    # Your logic for the listings page goes here
  end
end
