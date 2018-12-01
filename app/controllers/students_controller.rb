class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:term]
      @students = Student.where('name LIKE ?', "%#{params[:term]}%")
    else
      @students = Student.all
    end

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @students }
    end
  end

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @student }
    end
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @newStudent = Student.new(student_params)

    @newStudent.save!
    redirect_to @newStudent
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:name, :number, :phoneNumber, :email, :term)
  end
end
