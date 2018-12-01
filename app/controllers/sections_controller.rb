class SectionsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:term]
      @sections = Section.joins(:course).where("courses.name like ? or sections.number like ? or sections.semester like ?",
                                               "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}")
    else
      @sections = Section.all
    end

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @sections }
    end
  end

  def show
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @section }
    end
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @newSection = Section.new(section_params)

    @newSection.save!
    redirect_to @newSection
  end

  def update
    @section = Section.find(params[:id])

    if @section.update(section_params)
      redirect_to @section
    else
      render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to sections_path
  end

  private
  def section_params
    params.require(:section).permit(:semester, :number, :roomNumber, :course_id, :term)
  end
end