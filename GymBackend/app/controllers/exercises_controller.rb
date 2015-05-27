# 456710fb9b2e4234d74aa49f10c5a3619ef97847

class ExercisesController < ApplicationController

  def show
  	@exercise = Exercise.find(params[:id])
  end

  def index
 		@exercises = Exercise.all
  end

  private 
  	def exercise_params
  		params.require(:exercise).permit(:name, :description, :search)
  	end

end
