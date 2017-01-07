# == Schema Information
#
# Table name: professors
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
#  professor_id           :integer
#  admin                  :boolean          default(FALSE)
#

class Professor < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :groups
  has_many :quizzes, through: :groups

  validates :professor_id, presence: true, uniqueness: true

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
end
