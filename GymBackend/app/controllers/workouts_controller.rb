class WorkoutsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :edit, :destroy]  
  
  def new
    @new_workout = Workout.new
    #@all_goals = Goal.all
    @goals = current_user.goals
  end

  def create
    @workout = Workout.create(workout_params)
    if(@workout.save)
      flash[:success]= "Workout Recorded"
      redirect_to root_url
    end
  end

  def index
    @all_workouts = Workout.paginate(page: params[:page])
  end

  def edit
  end

  private
  def workout_params
    params.require(:workout).permit(:goal_id, :reps, :weight)
  end
end
