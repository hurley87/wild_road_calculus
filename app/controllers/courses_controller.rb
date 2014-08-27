class CoursesController < ApplicationController
  before_filter :require_login, only: [:new, :edit, :update, :destroy, :create]
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @course.lessons.build
  end

  def create
    @course = current_user.courses.build(course_params)
    @course.user = current_user
    if @course
      redirect_to courses_path, notice: 'save successful'
    else
      :new
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
    params.require(:course).permit(:length, :title, :short_description, :youtube, lessons_attributes: [:title, :time, :description, :short_description, :_destroy])
  end
end
