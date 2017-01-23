class Professors::HomeController < Professors::ApplicationController
  def index
    @attempts = current_professor.admin? ? Attempt.all : Attempt.where(group_id: current_professor.groups)
    @attempts = @attempts.page(params[:page]).per(25)
  end
end
