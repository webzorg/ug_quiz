# == Schema Information
#
# Table name: quizzes
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  active       :boolean
#  total_weight :float            default(0.0)
#  group_id     :integer
#  expires_at   :datetime
#

class Quiz < ApplicationRecord
  belongs_to :group

  has_many :question_categories, dependent: :destroy
  has_many :questions, through: :question_categories

  has_many :quiz_permutations, dependent: :destroy
  has_many :attempts, through: :quiz_permutations
  # has_many :question_permutations, through: :quiz_permutations

  validates :group, presence: true
  validate :validate_questions_per_quizzes

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :active, -> { where(active: true) }
  accepts_nested_attributes_for :question_categories, allow_destroy: true

  def number_of_questions
    questions.count
  end

  def number_of_active_questions
    question_categories.sum(&:questions_per_category)
  end

  def total_weight
    question_categories.inject(0) { |acc, elem| acc + elem.questions.count * elem.weight }
  end

  def total_possible_weight
    question_categories.inject(0) { |acc, elem| acc + elem.questions_per_category * elem.weight }
  end

  private

    def validate_questions_per_quizzes
      marked_for_destruction_counter = 0
      marked_for_destruction = false
      question_categories.each do |question_category|
        recount_questions = 0
        question_category.questions.each do |question|
          marked_for_destruction = question.marked_for_destruction?
          marked_for_destruction_counter += 1 if question.marked_for_destruction?
          recount_questions += 1
        end
        if question_category.questions_per_category > recount_questions - marked_for_destruction_counter && marked_for_destruction
          errors.add(" ", I18n.t(:number_of_questions_requested_in_quiz_exceeds_question_amount))
        end
      end
    end
end
