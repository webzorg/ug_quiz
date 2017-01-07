class Attempt < ApplicationRecord
  belongs_to :quiz
  belongs_to :student
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses
  after_validation :attempt_score_setter

  def attempt_score_setter
    update_attribute(:score, responses.select(&:correct).map(&:question).inject(0) do |acc, elem|
      acc + elem.question_category.weight.to_f
    end)
  end
end
