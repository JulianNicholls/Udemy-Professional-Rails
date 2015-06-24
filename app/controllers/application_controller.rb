# Functions in here are available to all controllers, but not the views.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?    # Publish to the rest of the app.

  def current_user
    @current_user ||= Chef.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
