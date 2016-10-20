class QuestionsController < Professors::ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questionzes/1
  def show
  end

  # GET /questionzes/1/edit
  def edit
  end

  # PATCH/PUT /questionzes/1
  def update
    # logger.debug("---------------HERE ARE THE PARAMS #{question_params[:answer_attributes][:options]}")
    if @question.update(question_params)
      redirect_to @question, notice: 'question was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def question_params
    params.require(:question).permit(:question, answer_attributes: [:id, :options, :_destroy])
  end
end
