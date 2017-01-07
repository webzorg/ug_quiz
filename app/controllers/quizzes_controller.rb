class QuizzesController < Professors::ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :toggle_quiz]
  before_action :remove_blank_group_ids_if_admin, only: [:update]
  # before_action :add_others_group_ids, only: [:create, :update]
  load_and_authorize_resource

  def index
    @quizzes = current_professor.admin? ? Quiz.all : current_professor.quizzes
    @quizzes = @quizzes.newest_first.page(params[:page]).per(25)
    fresh_when last_modified: @quizzes.maximum(:updated_at), public: true
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
      add_others_group_ids
      redirect_to @quiz, notice: "Quiz was successfully created."
    else
      render :new
    end
  end

  def update
    if @quiz.update(quiz_params)
      add_others_group_ids
      redirect_to @quiz, notice: "Quiz was successfully updated."
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
    redirect_to quizzes_url, notice: "Quiz was successfully destroyed."
  end

  private

  def add_others_group_ids
    return unless params[:others_group_ids].present?

    quiz_temp = @quiz.deep_clone include: [{ question_categories: { questions: :answers } }]
    params[:others_group_ids].reject(&:blank?).each do |group_id|
      quiz_temp.groups << Group.find(group_id)
    end
    quiz_temp.save
  end

  def remove_blank_group_ids_if_admin
    return unless current_professor.admin?
    params[:quiz].delete(:group_ids) if params[:quiz][:group_ids].reject(&:blank?).blank?
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(
      :active,
      :questions_per_quizzes,
      others_group_ids: [],
      group_ids: [],
      question_categories_attributes: [
        :id,
        :weight,
        :questions_per_category,
        :_destroy,
        questions_attributes: [
          :id,
          :content,
          :_destroy,
          answers_attributes: [
            :id,
            :content,
            :correct,
            :_destroy
          ]
        ]
      ]
    )
  end
end
