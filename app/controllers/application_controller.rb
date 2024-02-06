class ApplicationController < ActionController::Base
<<<<<<< HEAD
    before_action :configure_permitted_parameters, if: :devise_controller?
=======
>>>>>>> main
  
    protected
  
    def after_sign_in_path_for(resource)
      if resource.admin?
<<<<<<< HEAD
        admin_dashboard_index_path
      else
        user_dashboard_index_path
      end
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :date_of_birth, :address, :contact_details])
    end
  
    def after_sign_up_path_for(resource)
      root_path
    end
  end
  
=======
          admin_dashboard_index_path
      else
          user_dashboard_index_path
       end
  end
  end
>>>>>>> main
