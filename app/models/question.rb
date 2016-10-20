class Question < ApplicationRecord
  belongs_to :quiz, optional: true
  has_many :answers, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  accepts_nested_attributes_for :answers, allow_destroy: true
end
