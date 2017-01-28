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

class CoursesSemester < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  has_many :groups

  # concatenates name concats of semester & course
  def courses_semester_name_concat
    "#{semester.semester_name_concat} | #{course.course_name_concat}"
  end
end
