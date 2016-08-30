class Semester < ApplicationRecord
  has_many :groups, dependent: :destroy

  def semester_name
    "#{year} #{academicterm ? 'Spring' : 'Fall'}"
  end
end
