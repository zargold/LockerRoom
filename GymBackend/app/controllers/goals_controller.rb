class GoalsController < ApplicationController

  def index
  	@goals = Goal.all.paginate(page: params[:page])
  end

  def new
  	@goal = Goal.new
  	@exercises = Exercise.all
  end

  def show
  	@goal = Goal.find(params[:id])
  end

  def edit
  	@goal = Goal.find(params[:id])
  	@exercises = Exercise.all
  end

  def create
  	Goal.create(goal_params)
  	redirect_to(goals_path)
  end

  def update
  	@goal = Goal.find(params[:id])
  	@goal.update(goal_params)
  	redirect_to(goals_path)
  end

  def destroy
  	@goal = Goal.find(params[:id])
  	@goal.destroy
  	redirect_to(goals_path)
  end

  private 
  	def goal_params
  		params.require(:goal).permit(:exercise_id, :reps, :weight, :user_id)
  	end

end
