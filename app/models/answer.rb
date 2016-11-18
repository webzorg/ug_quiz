class Answer < ApplicationRecord
  translates :content, fallbacks_for_empty_translations: true

  belongs_to :question, optional: true
  has_many :answers_responses, dependent: :destroy
  has_many :responses, through: :answers_responses

  scope :oldest_first, -> { order(created_at: :asc) }
end
