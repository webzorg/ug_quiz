class QuestionCategory < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :quiz, optional: true
  validates :category_weight, numericality: { only_float: true, greater_than_or_equal_to: 0.1 }
  accepts_nested_attributes_for :questions, allow_destroy: true
end
