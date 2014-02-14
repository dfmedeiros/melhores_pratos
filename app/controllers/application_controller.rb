class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def rescue_record_not_found
    redirect_to root_path, flash: { error: I18n.t("app.page_not_found") }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:name, :avatar]
  end
end
