class CoursesController < ApplicationController
  before_filter :require_login, only: [:new, :edit, :update, :destroy, :create]
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lesson = @course.lessons.build
    @lessons = @course.lessons
  end

  def new
    @course = Course.new
    @course.lessons.build
  end

  def create
    @course = current_user.courses.build(course_params)
    @course.user = current_user
    if @course.save
      redirect_to @course, notice: 'save successful'
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
    params.require(:course).permit(:length, :title, :short_description, :youtube)
  end
end
