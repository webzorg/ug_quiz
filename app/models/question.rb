class Question < ApplicationRecord
  translates :content, fallbacks_for_empty_translations: true

  belongs_to :question_category, optional: true
  has_many :answers, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :questions_per_category, ->(q) { limit(q.questions_per_category) }

  delegate :questions_per_category, to: :question_category

  accepts_nested_attributes_for :answers, allow_destroy: true

  def correct_answers_count
    answers.select(&:correct?).count
  end

  def radio?
    answers.one?(&:correct)
  end
end
