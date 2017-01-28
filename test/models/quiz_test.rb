# == Schema Information
#
# Table name: quizzes
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  active       :boolean
#  total_weight :float            default(0.0)
#  group_id     :integer
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
