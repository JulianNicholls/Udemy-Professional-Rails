module LoginHelper
  def current_user
    @current_user ||= Chef.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    current_user == user
  end
end
