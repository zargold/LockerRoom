class ExercisesController < ApplicationController

  def show
  	@exercise = Exercise.find(params[:id])
  end
 
  def index
 	@exercises = Exercise.all
 	if params[:search]
 		@exercises = Exercise.search(params[:search]).limit(30)
 	else
 		@exercises = Exercise.all.limit(30).order('name ASC')
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
