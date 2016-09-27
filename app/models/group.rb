class Group < ApplicationRecord
  belongs_to :semester
  belongs_to :professor
  has_many :groups_students, dependent: :destroy
  has_many :students, through: :groups_students
  has_many :quizzes

  validates :name, uniqueness: true
  validates :group_id, presence: true, uniqueness: true
end
