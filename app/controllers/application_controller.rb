class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def rescue_record_not_found
    flash[:error] = "Page not found"
    redirect_to request.env["HTTP_REFERER"].present? ? :back : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:name, :avatar]
  end
end
