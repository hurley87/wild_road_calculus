class LessonsController < ApplicationController
  def show
  	@lesson = Lesson.find(params[:id])
  	@course = @lesson.course
  end

  def destroy
  	@lesson = Lesson.find(params[:id])
  	@lesson.destroy
  end
end
