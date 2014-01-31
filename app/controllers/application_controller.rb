class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def rescue_record_not_found
    flash[:error] = "Page not found"
    redirect_to request.env["HTTP_REFERER"].present? ? :back : root_path
  end
end
