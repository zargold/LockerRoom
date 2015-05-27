module SessionsHelper

#Log in the given user. Creates a temporary cookie for the user... This actually encrypts the user's ID.Temp encrypted user ID key...
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
