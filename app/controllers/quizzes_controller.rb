class QuizzesController < Professors::ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :toggle_quiz]
  load_and_authorize_resource

  def index
    @quizzes = current_professor.admin? ? Quiz.all : current_professor.quizzes
    @quizzes = @quizzes.page(params[:page]).per(25)
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Quiz was successfully created.'
    else
      logger.debug @quiz.errors.inspect
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  def toggle_quiz
    if @quiz.update_attributes(active: params[:active])
      respond_to do |format|
        @ajax_status_text = @quiz.active ? "Successfully activated quiz." : "Successfully deactivated quiz."
        @flash_status = @quiz.active ? "success" : "warning"
        format.js
      end
    else
      @ajax_status_text = "Request Failed"
      @flash_status = "danger"
      format.js
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:active, group_ids: [], questions_attributes: [:id, :content, :weight, :_destroy, answers_attributes: [:id, :content, :correct, :_destroy]])
  end
end
