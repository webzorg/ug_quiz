class QuizzesController < Professors::ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :toggle_quiz]

  # GET /quizzes
  def index
    @quizzes = Quiz.all.oldest_first
  end

  # GET /quizzes/1
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Quiz was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quizzes/1
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
        if @quiz.active
          @ajax_status_text = "Successfully activated quiz."
          @flash_status = "success"
        else
          @ajax_status_text = "Successfully deactivated quiz."
          @flash_status = "warning"
        end
        format.js
      end
    else
      @ajax_status_text = "Request Failed"
      @flash_status = "danger"
      format.js
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def quiz_params
    params.require(:quiz).permit(:professor_id, :active, group_ids: [], questions_attributes: [:id, :content, :weight, :_destroy, answers_attributes: [:id, :content, :correct, :_destroy]])
  end
end
