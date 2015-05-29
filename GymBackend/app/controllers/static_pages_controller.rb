class StaticPagesController < ApplicationController
  before_action :check_if_logged, only: [:home]
  def home
  end

  def about
  end

  def contact
  end

  def main
    @goals= current_user.goals.paginate(page: params[:page])
    @me= current_user
    @new_goal= current_user.goals.build if logged_in?
    @new_workout= current_user.workouts
  end

  def help
  end
  def check_if_logged
    if(logged_in?)
      redirect_to current_user
    end
  end
end
