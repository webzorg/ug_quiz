class Professors::ProfessorsController < Professors::ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :clean_password_params, only: [:update]
  load_and_authorize_resource

  def index
    @professors = Professor.where.not(id: current_professor.id).page(params[:page]).per(25)
  end

  def show
  end

  def new
    @professor = Professor.new
  end

  def edit
  end

  def create
    @professor = Professor.new(professor_params)

    if @professor.save
      redirect_to professors_professor_path(@professor), notice: 'Professor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @professor.update(professor_params)
      redirect_to professors_professor_path(@professor), notice: 'Professor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @professor.destroy
    redirect_to professors_professors_url, notice: 'Professor was successfully destroyed.'
  end

  private

  def clean_password_params
    if params[:professor][:password].blank? &&
       params[:professor][:password_confirmation].blank?
      params[:professor].delete(:password)
      params[:professor].delete(:password_confirmation)
    end
  end

  def set_professor
    @professor = Professor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def professor_params
    params.require(:professor).permit(:name, :professor_id, :email, :admin, :password, :password_confirmation)
  end
end
