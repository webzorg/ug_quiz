class Answer < ApplicationRecord
  belongs_to :student
  belongs_to :question

  scope :oldest_first, -> { order(created_at: :asc) }
end
