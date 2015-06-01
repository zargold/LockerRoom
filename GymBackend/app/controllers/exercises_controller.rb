require 'json'
class ExercisesController < ApplicationController

  before_action :logged_in_user, only: [:create, :edit, :update]
  
  def show
  	@exercise = Exercise.find(params[:id])
    @goals = @exercise.goals;
  end
 
  def index
 	if params[:search]
 		@exercises = Exercise.search(params[:search]).paginate(page: params[:page])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @exercises }
    end
 	else
 		@exercises = Exercise.order('name ASC').paginate(page: params[:page])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @exercises }
    end
 	end
  end

  def new
  	@exercise = Exercise.new
  end

  def create
  	Exercise.create(exercise_params)
  	redirect_to(exercises_path)
  end

  def edit
  	@exercise = Exercise.find(params[:id])

  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update(exercise_params)
    redirect_to @exercise
  end

  private 
  	def exercise_params
  		params.require(:exercise).permit(:name, :description, :search)
  	end

end
