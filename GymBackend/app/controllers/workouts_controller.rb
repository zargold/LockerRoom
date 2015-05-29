class WorkoutsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :edit, :destroy]  
  
  def new
    @new_workout = Workout.new
    #@all_goals = Goal.all
    @goals = current_user.goals
  end

  def create
    @workout = user.workouts.create(workout_params)
    if(@workout.save)
      flash[:success]= "Workout Recorded"
      render main_page_path
    end
  end

  def index
    @all_workouts = Workout.paginate(page: params[:page])
  end

  def edit
  end
end
