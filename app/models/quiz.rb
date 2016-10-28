class Quiz < ApplicationRecord
  has_many :groups_quizzes, dependent: :destroy
  has_many :groups, through: :groups_quizzes

  has_many :questions, dependent: :destroy
  has_many :attempts, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
