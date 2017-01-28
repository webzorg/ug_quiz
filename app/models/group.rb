# == Schema Information
#
# Table name: groups
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  professor_id        :integer
#  group_id            :integer
#  name                :string
#  courses_semester_id :integer
#

class Group < ApplicationRecord
  # default_scope { order(created_at: :desc) } # newest_first # breaks globalize gem.
  # translates :name, fallbacks_for_empty_translations: true

  belongs_to :courses_semester
  belongs_to :professor
  has_many :groups_students, dependent: :destroy
  has_many :students, through: :groups_students

  has_many :quizzes, dependent: :destroy

  has_many :quiz_permutations

  validates :group_id, presence: true, uniqueness: true, numericality: { only_integer: true }

  before_save :set_group_name

  def set_group_name
    self.name = "#{professor.name} | #{courses_semester.courses_semester_name_concat}"
  end
end
