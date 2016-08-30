class Group < ApplicationRecord
  belongs_to :semester
  has_many :students
  belongs_to :professor
end
