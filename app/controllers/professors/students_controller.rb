class Professors::StudentsController < Professors::ApplicationController
  before_action :set_professors_student, only: [:show, :edit, :update, :destroy]

  def index
    @professors_students = Student.all.page(params[:page]).per(25)
  end

  def show
  end

  def new
    @professors_student = Student.new
  end

  def edit
  end

  def create
    @professors_student = Student.new(professors_student_params)

    if @professors_student.save
      redirect_to professors_student_path(@professors_student), notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    params[:student].delete(:password) if params[:student][:password].blank?
    if @professors_student.update(professors_student_params)
      redirect_to professors_student_path(@professors_student), notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @professors_student.destroy
    redirect_to professors_students_url, notice: 'Student was successfully destroyed.'
  end

  private

  def set_professors_student
    @professors_student = Student.find(params[:id])
  end

  def professors_student_params
    params.require(:student).permit(:name, :student_id, :email, :password)
  end
end
