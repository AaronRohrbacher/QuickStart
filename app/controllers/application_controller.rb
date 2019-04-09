class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :business_name, :address_1, :address_2, :city, :state, :zip, :phone_1, :phone2])
  end

  def is_admin
    return if current_user.admin === true
    flash[:alert] = "Naughty naughty."
    redirect_to root_path
  end
end
