class Semester < ApplicationRecord
  has_many :groups, dependent: :destroy
  def semester_name_concat
    "#{year} - #{academicterm ? 'Spring' : 'Fall'}"
  end
  scope :newest_first, -> { order(created_at: :desc) }
end
