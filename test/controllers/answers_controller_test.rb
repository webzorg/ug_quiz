# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  correct     :boolean
#

require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
