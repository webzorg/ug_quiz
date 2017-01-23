class AttemptsController < ApplicationController
  before_action :set_attempt, only: [:show, :edit, :update, :destroy]
  # before_action :set_student_quizzes
  # before_action :set_quiz, only: [:new]
  load_and_authorize_resource

  def index
    @attempts = current_student.attempts
  end
  # def new
  # end

  def edit
    completed_quiz_fallback unless @attempt.status? # dev tempo Not for production
  end

  # def create
  #   params[:attempt][:responses_attributes] =
  #     params[:attempt][:responses_attributes].map do |key, value|
  #       { question_id: key, answer_ids: value }
  #     end
  #
  #   # @quiz = @active_quizzes.find(attempt_params[:quiz_id])
  #   # @attempt = @quiz.attempts.new(attempt_params)
  #   if @attempt.save
  #     redirect_to attempts_path, notice: I18n.t(:attempt_successfully_created)
  #   else
  #     render :new, quiz_id: @quiz.id
  #   end
  # end

  def update

    params[:attempt][:responses_attributes].delete_if {|key, value| value.is_a?(Hash) } # cleaning rails checkbox automagics
    params[:attempt][:responses_attributes] =
      params[:attempt][:responses_attributes].map do |key, value|
        { question_id: key, answer_ids: value }
      end

    if @attempt.update(attempt_params)
      redirect_to attempts_path, notice: "Attempt was successfully updated."
    else
      render :edit
    end
  end

  # def destroy
  #   @attempt.destroy
  #   redirect_to attempts_url, notice: "Attempt was successfully destroyed."
  # end

  private

  # def set_student_quizzes
  #   @active_quizzes = current_student.quizzes.newest_first.active.distinct
  # end
  #
  # def set_quiz
  #   @quiz = @active_quizzes.find(params[:quiz_id])
  # end

  def completed_quiz_fallback
    redirect_to attempts_path, notice: "Quiz already attempted."
  end

  def set_attempt
    @attempt = Attempt.find(params[:id])
  end

  def attempt_params
    params.require(:attempt).permit(:active, :student_id, responses_attributes: [:id, :question_id, :correct, :answer_ids, answer_ids: []])
  end
end
