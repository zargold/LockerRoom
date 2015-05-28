class UsersController < ApplicationController
  #Dries up code because it sets user to that user with the params id..
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :delete]
  before_action :admin_user, only: [:admin]

  #List of all users doesn't work yet...
  def index
    @users = User.paginate(page: params[:page])
  end
  #creating a new user /signingup
  def new
    #allows you to fill in some params
    @user= User.new
  end
#these are not included in the user_finder pre thing...
  def create
    @user = User.new(user_params)
    #on success we want to log In... display success and show the @user page..
    if @user.save
      log_in @user
      #indicates that the class will have succes in it and the message
      flash[:success]= "Welcome to LockerRoom, Thanks for signing up!"
      redirect_to @user
    else
      #otherwise let them try to sign up again...errors rendered as part of form..
      render 'new'
    end
  end

  def edit
  end
#server gets patch or put request...
  def update
    #should update that user using the patch flag in the form...
    if(@user.update_attributes(user_params))
    #handles success!
      flash[:success]= "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
      @sad_user = User.find(params[:id])
      flash[:success]= "User Deleted!"
      redirect_to users_url
  end

  def show
    @user= User.find(params[:id])
  end

  private
    def user_params
      #function works by first ensuring that the beginning of the path is users/
      #through require (then the permit: only allows these params to be taken in)
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
    #Before filters confirms a logged in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    #confirms the correct user is actually the one attempting to make an update/edit/del
    def correct_user
      @user= User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    #confirms admin user is logged in!
    def admin_user
      redirect_to(root_url), notice: [:danger]= "You require administrative privilages for this!" unless current_user.admin?
    end
end
