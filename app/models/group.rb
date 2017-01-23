# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  semester_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  professor_id :integer
#  course_id    :integer
#  group_id     :integer
#

class Group < ApplicationRecord
  default_scope { order(created_at: :desc) } # newest_first
  translates :name, fallbacks_for_empty_translations: true

  belongs_to :semester
  belongs_to :professor
  belongs_to :course
  has_many :groups_students, dependent: :destroy
  has_many :students, through: :groups_students

  has_many :groups_quizzes, dependent: :destroy
  has_many :quizzes, through: :groups_quizzes

  has_many :quiz_permutations

  validates :name, presence: true, uniqueness: true
  validates :group_id, presence: true, uniqueness: true, numericality: { only_integer: true }
end
