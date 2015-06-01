class WorkoutsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :edit, :destroy, :update]  
  
  def new
    @new_workout = Workout.new
    #@all_goals = Goal.all
    @goals = current_user.goals
  end

  def create
    @workout = Workout.new(workout_params)
    if (@workout.goal_id && Goal.find(@workout.goal_id).user == current_user)
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
      redirect_to root_url
    end
  end

  def show
    @workout = Workout.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @workout }
    end
  end

  def index
    goal = Goal.find(params[:goal_id])
    @workouts = goal.workouts
    respond_to do |format|
      format.html { render :index }
      format.json { render json: goal.workouts }
    end
  end

  def edit
    @all_goals = current_user.goals
  end

  private
  def workout_params
    params.require(:workout).permit(:goal_id, :reps, :weight)
  end

end
