module LoginsHelper
  def current_user
    @current_user ||= Chef.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    current_user == user
  end

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out_user
    session.delete :user_id
    @current_user = nil
  end
end
