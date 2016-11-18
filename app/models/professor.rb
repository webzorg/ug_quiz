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
