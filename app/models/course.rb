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
#

class Course < ApplicationRecord
  belongs_to :semester
  has_many :groups

  def course_name_concat
    "#{course_code} - #{course_name}"
  end
end
