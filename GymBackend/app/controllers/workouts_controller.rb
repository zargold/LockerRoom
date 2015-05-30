class WorkoutsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :edit, :destroy]  
  
  def new
    @new_workout = Workout.new
    #@all_goals = Goal.all
    @goals = current_user.goals
  end

  def create
    @workout = Workout.new(workout_params)
      if (Goal.find(@workout.goal_id).user == current_user)
        @workout.save 
        if(@workout.save)
          flash[:success]= "Workout Recorded"
          redirect_to root_url
        else
          flash[:danger]= "Workout Recording Failed"
          redirect_to root_url
        end
      else
        flash[:danger]= "You must be logged in to the correct user to save a workout"
      end
    end
  end

  def index
    @all_workouts = Workout.paginate(page: params[:page])
  end

  def edit
    @all_goals = current_user.goals
  end

  private
  def workout_params
    params.require(:workout).permit(:goal_id, :reps, :weight)
  end
end
