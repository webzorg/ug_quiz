# == Schema Information
#
# Table name: questions
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_category_id :integer
#

require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
