class Course < ApplicationRecord
  belongs_to :semester
  has_many :groups
end
