class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in"
    end
  end

  def prevent_login_signup
    if session[:user_id]
      redirect_to all_photos_path
    end
  end

  # Assign a current_user
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def check_user
    if session[:user_id] != params[:user_id].to_i
      redirect_to all_photos_path
    end
  end
end
