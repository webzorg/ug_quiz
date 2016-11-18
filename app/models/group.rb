class Group < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true

  belongs_to :semester
  belongs_to :professor
  has_many :groups_students, dependent: :destroy
  has_many :students, through: :groups_students

  has_many :groups_quizzes, dependent: :destroy
  has_many :quizzes, through: :groups_quizzes

  validates :name, uniqueness: true
  validates :group_id, presence: true, uniqueness: true, numericality: { only_integer: true }
end
