class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :business_name, :address_1, :address_2, :city, :state, :zip, :phone_1, :phone2])
  end
end
