class Custom::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!, only: [:new,:create]


  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        #sign_up(resource_name, resource)
        #respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        #expire_data_after_sign_in!
        #respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
      NotificationMailer.password_user(resource.email,params[:user][:password],resource.role).deliver_later
      redirect_to users_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

end
