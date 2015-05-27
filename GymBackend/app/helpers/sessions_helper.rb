module SessionsHelper

#Log in the given user. Creates a temporary cookie for the user... This actually encrypts the user's ID.Temp encrypted user ID key...
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    # cookies[:user_id]= {value: user.id, expires: 20.years.from_now.utc }
    cookies.permanent.signed[:user_id]=user.id
    cookies.permanent[:remember_token]=user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  def logged_in?
    !current_user.nil?
  end

  #Returns current user if logged in..
  def current_user
    
    if (user_id= session[:user_id])
    @current_user ||= User.find_by(id: user_id)
    elsif (user_id= cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  #Logging out involves destroying the session or refreshing it...

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  #returns true if the user is logged in, false otherwise...

end
