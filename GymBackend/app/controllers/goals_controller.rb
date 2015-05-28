class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

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
    puts "THIS IS THE #{current_user}"
  	@goal = current_user.goal.build(goal_params)
    if (@goal.save)
      flash[:success] = "Goal Set!"
      redirect_to(current_user)
    else
      render current_user
    end
  end

  def update
  	@goal = Goal.find(params[:id])
  	@goal.update(goal_params)
  	redirect_to(goals_path)
  end

  def destroy
  	@goal.destroy
    flash[:success]="Micropost deleted"
  	redirect_to(current_user)
  end

  private 
  	def goal_params
  		params.require(:goal).permit(:exercise_id, :reps, :weight)
  	end

    def correct_user
      @goal = current_user.goals.find_by(id:params[:id])
      redirect_to root_url if @goal.nil?
    end

end
