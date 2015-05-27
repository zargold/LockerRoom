class SessionsController < ApplicationController
  def new
  end
  def create
    user= User.find_by(email: params[:session][:email])
    if !!(user&&user.authenticate(params[:session][:password]))
      #Log in user and redirect to show.
      log_in user
      redirect_to user

    else
      #flash an error messages...
      flash.now[:danger]= "Invalid email/password combo"
      render "new"
    end

  end
end
