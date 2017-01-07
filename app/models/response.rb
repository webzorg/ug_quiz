# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  question_id :integer
#  attempt_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  correct     :boolean
#

class Response < ApplicationRecord
  belongs_to :attempt
  belongs_to :question
  has_many :answers_responses, dependent: :destroy
  has_many :answers, through: :answers_responses

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
    puts "***********************************"
    puts "*************** #{question.id}"
    correct_method_name = question.radio? ? radio_correct? : checkbox_correct?
    update_attribute(:correct, correct_method_name)
  end
end
