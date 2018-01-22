class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    #edit_member_registration_path
     home_userview_path
  end
end