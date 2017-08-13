class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name,:lastname,:mobile,:disabled,:rol,:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:lastname,:mobile,:disabled])
    elsif resource_class == Admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name,:lastname,:mobile,:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:lastname,:mobile])
    end
  end

  def authenticate?
    if current_admin || current_user
      true
    end
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    if current_admin
      admins_path
    else#We need to change this, for another specific route
      requests_path
    end
  end
end
