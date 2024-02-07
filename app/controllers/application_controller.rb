class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :date_of_birth, :address, :contact_details])
    end
  
    def role
        @role = current_user.role
    end

    def after_sign_in_path_for(resource)
      if resource.admin?
        admin_dashboard_index_path
      else
          user_dashboard_index_path
       end
    end
end
