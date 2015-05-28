class ExercisesController < ApplicationController

  def show
  	@exercise = Exercise.find(params[:id])
  end
 
  def index
 	if params[:search]
 		@exercises = Exercise.search(params[:search]).paginate(page: params[:page])
 	else
 		@exercises = Exercise.order('name ASC').paginate(page: params[:page])
 	end
  end

  def new
  	@exercise = Exercise.new
  end

  def create
  	Exercise.create(exercise_params)
  	redirect_to(exercises_path)
  end

  def show
  	@exercise = Exercise.find(params[:id])
  end

  def edit
  	@exercises = Exercise.find(params[:id])
  end

  private 
  	def exercise_params
  		params.require(:exercise).permit(:name, :description, :search)
  	end

end
