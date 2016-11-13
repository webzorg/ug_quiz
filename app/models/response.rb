class Response < ApplicationRecord
  belongs_to :attempt
  belongs_to :question
  has_many :answers_responses
  has_many :answers, through: :answers_responses

  validates :answers, presence: true
  after_validation :response_correct_setter

  def correct_answers_count
    answers.select(&:correct?).count
  end

  def radio_correct?
    !answers.empty? && answers.all?(&:correct?)
  end

  def checkbox_correct?
    question.correct_answers_count == correct_answers_count &&
      !answers.empty? &&
      answers.all?(&:correct?)
  end

  def response_correct_setter
    correct_method_name = question.radio? ? radio_correct? : checkbox_correct?
    update_attribute(:correct, correct_method_name)
  end
end
