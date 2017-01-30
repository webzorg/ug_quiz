# == Schema Information
#
# Table name: semesters
#
#  id           :integer          not null, primary key
#  year         :integer
#  academicterm :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Semester < ApplicationRecord
  # has_many :groups, dependent: :destroy

  has_many :courses_semesters, dependent: :destroy
  has_many :courses, through: :courses_semesters
  scope :newest_first, -> { order(created_at: :desc) }

  validates :academicterm, uniqueness: { scope: :year }

  def semester_name_concat
    "#{year}-#{academicterm ? I18n.t(:spring) : I18n.t(:fall)}"
  end
end
