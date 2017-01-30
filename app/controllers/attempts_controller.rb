class AttemptsController < ApplicationController
  before_action :set_attempt, only: [:edit, :update]
  load_and_authorize_resource

  def index
    @attempts = current_student.attempts & Quiz.active.map(&:attempts).flatten
  end

  def edit
    completed_quiz_fallback if @attempt.completed?
  end

  def update
    # cleaning rails checkbox automagics
    params[:attempt][:responses_attributes].delete_if { |_key, value| value.is_a?(Hash) }

    params[:attempt][:responses_attributes] =
      params[:attempt][:responses_attributes].map do |key, value|
        { question_id: key, answer_ids: value }
      end

    if @attempt.update(attempt_params)
      @attempt.update_attributes(completed: true)
      redirect_to attempts_path, notice: I18n.t(:quiz_successfully_submitted)
    else
      render :edit
    end
  end

  private

    def completed_quiz_fallback
      redirect_to attempts_path, notice: I18n.t(:quiz_already_completed)
    end

    def set_attempt
      @attempt = Attempt.find(params[:id])
      redirect_to attempts_path, notice: I18n.t(:quiz_expired) unless @attempt.quiz_permutation.quiz.active?
    end

    def attempt_params
      params.require(:attempt).permit(
        :student_id,
        responses_attributes: [:id, :question_id, :correct, :answer_ids, answer_ids: []]
      )
    end
end
