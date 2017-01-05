class Semester < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :courses
  scope :newest_first, -> { order(created_at: :desc) }

  validates :academicterm, uniqueness: { scope: :year }

  def semester_name_concat
    "#{year} - #{academicterm ? I18n.t(:spring) : I18n.t(:fall)}"
  end
end
