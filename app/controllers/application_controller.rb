class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :mobileNumber,:image, :image_cache, :remove_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :mobileNumber,:image, :image_cache, :remove_image])
  end

  def after_sign_in_path_for(resource)
    if member_signed_in?
        home_userview_path
    else
      super
   
   end

  end
   

end
