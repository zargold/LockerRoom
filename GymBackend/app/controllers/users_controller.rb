class UsersController < ApplicationController
  before_action :user_finder, only: [:show, :edit, :update]
  def user_finder
    @user = User.find(params[:id])
  end
  
  def index
  end

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]= "Welcome to LockerRoom, Thanks for signing up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.update_attributes?
      flash[:success]= "Thank you for your edit"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
