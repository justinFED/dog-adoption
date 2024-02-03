class ApplicationController < ActionController::Base
  
    protected
  
    def after_sign_in_path_for(resource)
      # Check if the signed-in user is an admin
      if resource.is_a?(User) && resource.admin?
        admin_dashboard_index_path
      else
        # Redirect to a different path for non-admin users
        super
      end
    end
  end
  