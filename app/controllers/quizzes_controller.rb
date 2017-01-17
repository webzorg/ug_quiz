class QuizzesController < Professors::ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :toggle_quiz]
  before_action :remove_blank_group_ids_if_admin, only: [:update]
  before_action :groups_set_for_create, only: [:create]
  before_action :groups_set_for_update, only: [:update]
  after_action :permutate_quiz, only: [:create, :update]
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

  def groups_set_for_create
    group_ids = params[:quiz][:group_ids].reject(&:empty?)
    group_ids += params[:others_group_ids] if params[:others_group_ids].present?
    @temp_groups = Group.find(group_ids)
  end

  def groups_set_for_update
    group_ids = params[:quiz][:group_ids].present? ? params[:quiz][:group_ids].reject(&:empty?) : []
    group_ids += params[:others_group_ids] if params[:others_group_ids].present?
    group_ids = group_ids.map(&:to_i)
    @temp_groups = Group.find(group_ids)
  end

  def permutate_quiz
    return unless @quiz.valid?
    logger.debug "********************************* TEMP_QUIZZ #{@temp_quizzes}"
    logger.debug "********************************* GROUPS SIZE #{@temp_groups}"

    @zipped_quizzes_groups = @temp_quizzes.zip(@temp_groups)
    group_ids_param_size = params[:quiz][:group_ids].reject(&:empty?).size

    if group_ids_param_size > 1
      (group_ids_param_size - 1).times do
        @zipped_quizzes_groups = @temp_quizzes.unshift(@temp_quizzes[0]).zip(@temp_groups) + @zipped_quizzes_groups
      end
    end
    logger.debug "************************* #{@zipped_quizzes_groups}"

    @zipped_quizzes_groups.each do |quiz, group|
      logger.debug "************************* #{quiz.id}"
      logger.debug "************************* #{group.id}"
      group.students.each do |student|
        quiz_permutation = QuizPermutation.find_or_create_by(quiz_id: quiz.id, student_id: student.id, group_id: group.id)
        @quiz.question_categories.each do |question_category|
          question_category.questions.sample(question_category.questions_per_category).each do |question|
            QuestionPermutation.find_or_create_by(
              quiz_permutation_id: quiz_permutation.id,
              question_id: question.id,
              question_category_id: question_category.id
            )
          end # questions.sample.each
        end # question_categories.each
      end # students.each
    end # temp_quizzes.each
  end

  def add_others_group_ids
    @temp_quizzes = [@quiz]
    return unless params[:others_group_ids].present?
    others_group_ids = params[:others_group_ids].reject(&:blank?).map(&:to_i)
    groups = Group.where(id: others_group_ids)
    professors = Professor.where(id: groups.map(&:professor_id).uniq)

    professors.each do |professor|
      quiz_temp = @quiz.deep_clone include: [{ question_categories: { questions: :answers } }]
      quiz_temp.groups << Group.where(id: others_group_ids & professor.groups.map(&:id))
      @temp_quizzes << quiz_temp
      quiz_temp.save
    end
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
