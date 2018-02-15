class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?
  protected
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :mobileNumber,:image, :image_cache, :remove_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :mobileNumber,:image, :image_cache, :remove_image])
  end

   def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end  
    private
    # Its important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an 
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:member, request.fullpath)
    end 


end
