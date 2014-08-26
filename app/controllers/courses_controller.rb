class CoursesController < ApplicationController
  def index
    @courses = Courses.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
      @course = Course.new
    @coures.lessons.build
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course
      redirect_to coures_path, notice: 'save successful'
    else
      :new, notice: 'there was an error'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:length, :title, :short_description, :youtube, :lessons_attributes: [:title, :time, :description, :short_description])
  end
end
