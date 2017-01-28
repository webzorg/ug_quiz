# == Schema Information
#
# Table name: courses_semesters
#
#  id          :integer          not null, primary key
#  semester_id :integer
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CoursesSemesterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
