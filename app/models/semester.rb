class Semester < ApplicationRecord
  has_many :groups, dependent: :destroy

  scope :newest_first, -> { order(created_at: :desc) }

  def semester_name_concat
    "#{year} - #{academicterm ? I18n.t(:spring) : I18n.t(:fall)}"
  end
end
