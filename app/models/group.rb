class Group < ApplicationRecord
  belongs_to :semester
  has_many :students, dependent: :nullify
  belongs_to :professor

  validates_uniqueness_of :name
end
