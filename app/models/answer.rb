class Answer < ApplicationRecord
  belongs_to :question, optional: true
  has_many :answers_responses
  has_many :responses, through: :answers_responses

  scope :oldest_first, -> { order(created_at: :asc) }

  def correct?
    correct == true
  end
end
