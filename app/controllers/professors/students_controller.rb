class Professors::StudentsController < Professors::ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all.page(params[:page]).per(25)
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to professors_student_path(@student), notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    params[:student].delete(:password) if params[:student][:password].blank?
    if @student.update(student_params)
      redirect_to professors_student_path(@student), notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to professors_students_url, notice: 'Student was successfully destroyed.'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :student_id, :email, :password)
  end
end
