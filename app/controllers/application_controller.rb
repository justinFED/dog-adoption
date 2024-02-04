class ApplicationController < ActionController::Base
  
    protected
  
    def after_sign_in_path_for(resource)
      if resource.admin?
          admin_dashboard_index_path
      else
          user_dashboard_index_path
       end
  end
  end