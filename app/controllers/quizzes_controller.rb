class QuizzesController < Professors::ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :toggle_quiz]
  # before_action :remove_blank_group_ids_if_admin, only: [:update]
  before_action :groups_set_for_create, only: [:create]
  before_action :groups_set_for_update, only: [:update]
  before_action :cleanup_quiz_permutations_for_removed_groups, only: [:update]
  before_action :cleanup_questions_permutations_for_removed_groups, only: [:update]
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
    group_ids = []
    group_ids << params[:quiz][:group_id]
    group_ids += params[:others_group_ids] if params[:others_group_ids].present?
    @temp_groups = Group.find(group_ids)
  end

  def groups_set_for_update
    group_ids = []
    group_ids << params[:quiz][:group_id]
    @belongs_to_group_id = group_ids
    group_ids += params[:others_group_ids] if params[:others_group_ids].present?
    group_ids.map!(&:to_i)
    @temp_groups = Group.find(group_ids)
  end

  def permutate_quiz
    return unless @quiz.valid?

    @temp_quizzes.zip(@temp_groups).each do |quiz, group|

      group.students.each do |student|
        quiz_permutation = QuizPermutation.find_or_create_by(quiz_id: quiz.id, student_id: student.id, group_id: group.id)

        # Find attempt, set completed to false and delete all responses.
        attempts_handler(quiz_permutation, student)

        quiz.question_categories.shuffle.each do |question_category|
          question_category.questions.sample(question_category.questions_per_category).each do |question|
            QuestionPermutation.create(
              quiz_permutation_id: quiz_permutation.id,
              question_id: question.id,
              question_category_id: question_category.id
            )
            # quiz_permutation.attempt.responses << Response.create(question_id: question.id)
          end # questions.sample.each
        end # question_categories.each
      end # students.each
    end # temp_quizzes.each
  end

  def attempts_handler(quiz_permutation, student)
    quiz_permutation.attempt = Attempt.find_or_create_by(student_id: student.id, quiz_permutation_id: quiz_permutation.id)
    quiz_permutation.attempt.update_attributes(completed: false)
    quiz_permutation.attempt.responses.destroy_all # delete all student responses on quiz update
  end

  def add_others_group_ids
    @temp_quizzes = [@quiz]
    return unless params[:others_group_ids].present?
    groups = Group.where(id: params[:others_group_ids].reject(&:blank?).map(&:to_i))
    professors = Professor.where(id: groups.map(&:professor_id).uniq)

    groups.each do |group|
      quiz_temp = @quiz.deep_clone include: [{ question_categories: { questions: :answers } }]
      quiz_temp.group = group
      @temp_quizzes << quiz_temp
      quiz_temp.save
    end
  end



  def cleanup_quiz_permutations_for_removed_groups
    # cleaning up quiz permutations after removing it from group
    QuizPermutation.where(quiz_id: @quiz.id).where.not(group_id: @belongs_to_group_id).destroy_all
  end

  def cleanup_questions_permutations_for_removed_groups
    # cleaning up question permutations before generating new ones
    QuestionPermutation.where(quiz_permutation_id: @quiz.quiz_permutations).destroy_all
  end

  # def remove_blank_group_ids_if_admin
  #   return unless current_professor.admin?
  #   params[:quiz].delete(:group_ids) if params[:quiz][:group_ids].reject(&:blank?).blank?
  # end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(
      :active,
      :questions_per_quizzes,
      :group_id,
      others_group_ids: [],
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
