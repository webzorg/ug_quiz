class Quiz < ApplicationRecord
  has_many :groups_quizzes, dependent: :destroy
  has_many :groups, through: :groups_quizzes

  has_many :questions, dependent: :destroy
  has_many :attempts, dependent: :destroy

  validates :groups, presence: true

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :active, -> { where(active: true) }
  accepts_nested_attributes_for :questions, allow_destroy: true
end
