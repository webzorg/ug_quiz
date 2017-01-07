# == Schema Information
#
# Table name: attempts
#
#  id         :integer          not null, primary key
#  quiz_id    :integer
#  student_id :integer
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
