# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  semester_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  professor_id :integer
#  course_id    :integer
#  group_id     :integer
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
