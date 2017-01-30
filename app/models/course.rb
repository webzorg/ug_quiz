# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  translates :course_name, fallbacks_for_empty_translations: true

  has_many :courses_semesters, dependent: :destroy
  has_many :semesters, through: :courses_semesters
  has_many :groups

  def course_name_concat
    "#{course_code} - #{course_name}"
  end
end
