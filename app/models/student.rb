class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates_uniqueness_of :student_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups_students
  has_many :groups, through: :groups_students

  def student_name_concat
    "#{student_id} - #{name}"
  end
end
