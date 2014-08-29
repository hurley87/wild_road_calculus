class LessonsController < ApplicationController
  def show
  	@lesson = Lesson.find(params[:id])
  end

  def create
  	@course = Course.find(params[:course_id])
  	@lesson = @course.lessons.build(lesson_params)
  	@lesson.user = current_user

  	if @lesson.save 
  		redirect_to @course, notice: 'Lesson created'
  	else
  		render 'courses/show'
  	end
  end

  def destroy
  	@lesson = Lesson.find(params[:id])
  	@lesson.destroy
  end

  private

  def lesson_params
  	params.require(:lesson).permit(:title, :time, :short_description, :desription, :course_id, :user_id)
  end
end
