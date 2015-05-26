class GoalsController < ApplicationController
  def index
  	@goals = Goal.all
  end

  def new
  	@goal = Goal.new
  end

  def show
  	@goal = Goal.find(params[:id])
  end

  def edit
  	@goal = Goal.find(params[:id])
  end

  def create
  	Goal.create(goal_params)
  	redirect_to(goals_path)
  end

  def update
  	@goal = Goal.find([:id])
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
  		params.require(:goal).permit(:exersice_id, :reps, :weight, :user_id)
  	end

end
