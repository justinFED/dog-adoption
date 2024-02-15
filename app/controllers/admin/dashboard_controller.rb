class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @users = User.all
    end

     def show
    @users = User.where.not(role: 'admin')
  end
  end
  