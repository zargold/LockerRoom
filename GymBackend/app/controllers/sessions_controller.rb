class SessionsController < ApplicationController
  #Render the LOG IN PAGE...! Where the user can log in to this session...
  def new
  end
  #Actually create the session based on the params if authenticated!
  def create
    user= User.find_by(email: params[:session][:email])
    if !!(user&&user.authenticate(params[:session][:password]))
      #Log in user and redirect to show.
      log_in user
      remember user
      redirect_to user
    else
      #flash an error messages...
      flash.now[:danger]= "Invalid email/password combo"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
