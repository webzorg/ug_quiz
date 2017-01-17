# == Schema Information
#
# Table name: quiz_permutations
#
#  id         :integer          not null, primary key
#  questions  :text             default([]), is an Array
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  group_id   :integer
#

class QuizPermutation < ApplicationRecord
  belongs_to :quiz
  belongs_to :student
  belongs_to :group
  has_many :question_permutations, dependent: :destroy
  accepts_nested_attributes_for :question_permutations, allow_destroy: true
end
