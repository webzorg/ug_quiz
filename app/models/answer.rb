class Answer < ApplicationRecord
  belongs_to :question, optional: true
  has_many :responses

  scope :oldest_first, -> { order(created_at: :asc) }
end
