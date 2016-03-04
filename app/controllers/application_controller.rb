class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_user_signed_in
    if current_user == nil
      redirect_to new_user_session_path, alert: 'Phải đăng nhập trước'
    end
  end
end
