class QuestionCategory < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :quiz, optional: true

  validates :weight, numericality: { only_float: true, greater_than_or_equal_to: 0.1 }
  validates :questions_per_category, numericality: {
    only_integer: true,
    less_than_or_equal_to: proc { |x| x.questions.size }
  }

  accepts_nested_attributes_for :questions, allow_destroy: true
end
