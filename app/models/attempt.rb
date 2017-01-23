# == Schema Information
#
# Table name: attempts
#
#  id                  :integer          not null, primary key
#  student_id          :integer
#  score               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  quiz_permutation_id :integer
#  status              :boolean          default(TRUE)
#

class Attempt < ApplicationRecord
  default_scope { order(created_at: :desc) } # newest_first
  belongs_to :student
  belongs_to :quiz_permutation
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses, update_only: true
  after_validation :attempt_score_setter

  def attempt_score_setter
    update_attribute(
      :score, responses.select(&:correct).map(&:question).inject(0) { |acc, elem| acc + elem.question_category.weight.to_f }
    )
    update_attribute(:status, false)
  end
end
