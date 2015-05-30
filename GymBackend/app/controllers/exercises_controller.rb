
require 'json'

class ExercisesController < ApplicationController

  def show
  	@exercise = Exercise.find(params[:id])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @exercise }
    end
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

  def show
  	@exercise = Exercise.find(params[:id])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @exercise }
    end
  end

  def edit
  	@exercises = Exercise.find(params[:id])
    secret = JSON.load File.new('secrets.json')
    @key = secret["key"]
    puts @key
  end


  private 
  	def exercise_params
  		params.require(:exercise).permit(:name, :description, :search)
  	end

end
