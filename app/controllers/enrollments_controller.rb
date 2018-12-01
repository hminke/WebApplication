class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:term]
      @enrollments = Enrollment.joins(:student).joins(section: :course)
                         .where("students.name like ? or courses.name like ? or sections.semester like ?",
                                "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%")
    else
      @enrollments = Enrollment.all
    end

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @enrollments }
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def create
    @newEnrollment = Enrollment.new(enrollment_params)

    @newEnrollment.save!
    redirect_to @newEnrollment
  end

  def update
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.update(enrollment_params)
      redirect_to @enrollment
    else
      render 'edit'
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    redirect_to enrollments_path
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :section_id, :term)
  end
end
