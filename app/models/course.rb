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

class Course < ApplicationRecord
  belongs_to :semester
  has_many :groups
end
