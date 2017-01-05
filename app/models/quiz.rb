class Quiz < ApplicationRecord
  has_many :groups_quizzes, dependent: :destroy
  has_many :groups, through: :groups_quizzes

  has_many :question_categories, dependent: :destroy
  has_many :questions, through: :question_categories
  has_many :attempts, dependent: :destroy

  validates :groups, presence: true

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :active, -> { where(active: true) }
  accepts_nested_attributes_for :question_categories, allow_destroy: true
end
