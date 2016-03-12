class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_user_signed_in
    if current_user == nil
      redirect_to new_user_session_path, alert: 'Phải đăng nhập trước'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).concat([:avatar, :name])
    devise_parameter_sanitizer.for(:sign_up).concat([:name])
  end
end
