class ApplicationController < ActionController::Base
  before_action :configure_authentication
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path
  end

  private

  def configure_authentication
    if admin_controller?
      authenticate_admin!
   # else
    #  authenticate_user! unless action_is_public?
    end
  end

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
