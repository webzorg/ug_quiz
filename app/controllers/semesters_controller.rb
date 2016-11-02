class SemestersController < Professors::ApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @semesters = Semester.all.newest_first.page(params[:page]).per(25)
  end

  def show
  end

  def new
    @semester = Semester.new
  end

  def edit
  end

  def create
    @semester = Semester.new(semester_params)

    if @semester.save
      redirect_to @semester, notice: 'Semester was successfully created.'
    else
      render :new
    end
  end

  def update
    if @semester.update(semester_params)
      redirect_to @semester, notice: 'Semester was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @semester.destroy
    redirect_to semesters_url, notice: 'Semester was successfully destroyed.'
  end

  private

  def set_semester
    @semester = Semester.find(params[:id])
  end

  def semester_params
    params.require(:semester).permit(:year, :academicterm)
  end
end
