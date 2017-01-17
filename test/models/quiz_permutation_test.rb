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

require 'test_helper'

class QuizPermutationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
