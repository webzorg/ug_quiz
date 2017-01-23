# == Schema Information
#
# Table name: question_permutations
#
#  id                   :integer          not null, primary key
#  quiz_permutation_id  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_id          :integer
#  question_category_id :integer
#

class QuestionPermutation < ApplicationRecord
  belongs_to :quiz_permutation
  belongs_to :question_category
  belongs_to :question
end
