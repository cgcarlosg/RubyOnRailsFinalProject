module SessionsHelper
  def remember(user)
    cookies.permanent.signed[:username] = user.username
    @current_user = user
  end

  def log_in(user)
    session[:username] = user.username
  end

  def current_user
    @current_user ||= User.find_by(username: cookies.signed[:username])
  end

  def current_user=(user)
    @current_user = user
  end

  def forget(_user)
    cookies.delete(:username)
  end

  def log_out
    forget(current_user)
  end

  def logged_in?
    !current_user.nil?
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
