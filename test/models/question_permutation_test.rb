# == Schema Information
#
# Table name: question_permutations
#
#  id                   :integer          not null, primary key
#  questions            :text             default([]), is an Array
#  quiz_permutation_id  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_id          :integer
#  question_category_id :integer
#

require 'test_helper'

class QuestionPermutationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
