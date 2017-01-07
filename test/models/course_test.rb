# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_name :string
#  course_code :string
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_id    :integer
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
