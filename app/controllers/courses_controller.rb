class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:term]
      @courses = Course.where('name LIKE ?', "%#{params[:term]}%")
    else
      @courses = Course.all
    end

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @courses }
    end
  end

  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @course }
    end
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @newCourse = Course.new(course_params)

    @newCourse.save!
    redirect_to @newCourse
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(:name, :department, :number, :creditHours, :term)
  end
end
