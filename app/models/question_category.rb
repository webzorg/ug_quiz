# == Schema Information
#
# Table name: question_categories
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  weight                 :float            default(1.0)
#  quiz_id                :integer
#  questions_per_category :integer          default(1)
#

class QuestionCategory < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :quiz, optional: true

  validates :weight, numericality: { only_float: true, greater_than_or_equal_to: 0.1 }
  validates :questions_per_category, numericality: {
    only_integer: true,
    less_than_or_equal_to: proc { |x| x.questions.size }
  }

  default_scope { order(created_at: :asc) } # oldest_first

  accepts_nested_attributes_for :questions, allow_destroy: true

  def number_of_questions
    questions.count
  end

  def category_max_score_sum
    questions.count * weight
  end

  def category_possible_score_sum
    questions_per_category * weight
  end
end
