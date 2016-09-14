class Group < ApplicationRecord
  belongs_to :semester
  #  has_many :students, dependent: :nullify
  belongs_to :professor

  has_many :groups_students, dependent: :destroy
  has_many :students, through: :groups_students

  validates_uniqueness_of :name
end
