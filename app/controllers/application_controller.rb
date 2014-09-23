class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    create_team_path
  end

  def after_sign_out_path_for(resource)
    myteam_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:subdomain, :username, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:subdomain, :username, :password, :remember_me) }
  end
end

