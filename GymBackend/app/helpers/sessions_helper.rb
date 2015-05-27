module SessionsHelper

#Log in the given user. Creates a temporary cookie for the user... This actually encrypts the user's ID.Temp encrypted user ID key...
  def log_in(user)
    session[:user_id] = user.id
  end

#Logging out involves destroying the session or refreshing it...

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  #Returns current user if logged in..
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  #returns true if the user is logged in, false otherwise...
  def logged_in?
    !current_user.nil?
  end

end
