class Question < ApplicationRecord
  belongs_to :quiz, optional: true
  has_many :answers, dependent: :destroy

  # has_many :responses, through: :answers

  validates :weight, numericality: { only_float: true, greater_than_or_equal_to: 0.1 }

  scope :oldest_first, -> { order(created_at: :asc) }
  accepts_nested_attributes_for :answers, allow_destroy: true

  # helpers
  def correct_options
    answers.correct
  end

  def incorrect_options
    answers.incorrect
  end
end
