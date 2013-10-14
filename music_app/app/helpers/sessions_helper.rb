module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end
  
  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  
  def logged_in?
    !!current_user
  end
end
