class User::DashboardController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def listings
    # Your logic for the listings page goes here
  end
end
=======
    before_action :authenticate_user!
  
    def index
        @user = current_user
       
      end
  end
  
>>>>>>> main
