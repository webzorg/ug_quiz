class Professors::ProfessorsController < Professors::ApplicationController
  before_action :set_professors_professor, only: [:show, :edit, :update, :destroy]
  before_action :clean_parssword_params, only: [:update]

  def index
    @professors_professors = Professor.where.not(id: current_professor.id).page(params[:page]).per(25)
  end

  def show
  end

  def new
    @professors_professor = Professor.new
  end

  def edit
  end

  def create
    @professors_professor = Professor.new(professors_professor_params)

    if @professors_professor.save
      redirect_to @professors_professor, notice: 'Professor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @professors_professor.update(professors_professor_params)
      redirect_to professors_professor_path(@professors_professor), notice: 'Professor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @professors_professor.destroy
    redirect_to professors_professors_url, notice: 'Professor was successfully destroyed.'
  end

  private

  def clean_parssword_params
    if params[:professor][:password].blank? &&
       params[:professor][:password_confirmation].blank?
      params[:professor].delete(:password)
      params[:professor].delete(:password_confirmation)
    end
  end

  def set_professors_professor
    @professors_professor = Professor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def professors_professor_params
    params.require(:professor).permit(:name, :professor_id, :email, :admin, :password, :password_confirmation)
  end
end
