class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


	# Catch all CanCan errors and alert the user of the exception
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden, content_type: 'text/html' }
			format.html { redirect_to main_app.root_url, notice: exception.message }
			format.js   { head :forbidden, content_type: 'text/html' }
		end
	end

	private

		def record_not_found
			render file: "#{Rails.root}/public/404", layout: true, status: :not_found
		end

	protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :annonascita, :indirizzo)}
			devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :email, :username, :indirizzo, :annonascita, :password, :password_confirmation, :current_password)}
		end


end
