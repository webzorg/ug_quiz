class Semester < ApplicationRecord
  has_many :groups, dependent: :destroy
  validates_uniqueness_of :name
  def semester_name_concat
    "#{year} - #{academicterm ? 'Spring' : 'Fall'}"
  end
end
