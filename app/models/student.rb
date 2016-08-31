class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :group, optional: true

  validates_uniqueness_of :student_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def student_name_concat
    "#{student_id} - #{name}"
  end
end
