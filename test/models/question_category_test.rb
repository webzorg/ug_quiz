# == Schema Information
#
# Table name: question_categories
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  weight                 :float            default(1.0)
#  quiz_id                :integer
#  questions_per_category :integer          default(1)
#

require 'test_helper'

class QuestionCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
