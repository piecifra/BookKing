class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  protected

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :annonascita, :indirizzo)}
  		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :email, :username, :indirizzo, :annonascita, :password, :password_confirmation, :current_password)}
  	end


end
