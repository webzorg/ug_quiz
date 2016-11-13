class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :student_id, presence: true, uniqueness: true
  validates :name, presence: true

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :groups_students
  has_many :groups, through: :groups_students

  has_many :quizzes, through: :groups

  has_many :attempt, dependent: :destroy

  def student_name_concat
    "#{student_id} - #{name}"
  end
end
