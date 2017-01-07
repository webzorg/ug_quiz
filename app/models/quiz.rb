# == Schema Information
#
# Table name: quizzes
#
#  id                    :integer          not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  active                :boolean
#  questions_per_quizzes :integer
#  total_weight          :float            default(0.0)
#

class Quiz < ApplicationRecord
  has_many :groups_quizzes, dependent: :destroy
  has_many :groups, through: :groups_quizzes

  has_many :question_categories, dependent: :destroy
  has_many :questions, through: :question_categories
  has_many :attempts, dependent: :destroy

  validates :groups, presence: true
  validates :questions_per_quizzes, numericality: { only_integer: true }
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
    recount_questions = 0

    question_categories.each do |question_category|
      question_category.questions.each do |question|
        marked_for_destruction_counter += 1 if question.marked_for_destruction?
        recount_questions += 1
      end
    end

    errors.add(:questions_per_quizzes, I18n.t(:number_of_questions_requested_in_quiz_exceeds_question_amount)) if questions_per_quizzes > recount_questions - marked_for_destruction_counter
  end

end
