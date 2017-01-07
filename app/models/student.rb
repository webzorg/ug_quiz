# == Schema Information
#
# Table name: students
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  student_id             :integer
#

class Student < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true
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
