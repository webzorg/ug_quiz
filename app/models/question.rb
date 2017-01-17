# == Schema Information
#
# Table name: questions
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_category_id :integer
#

class Question < ApplicationRecord
  translates :content, fallbacks_for_empty_translations: true
  has_many :question_permutations, dependent: :destroy

  belongs_to :question_category, optional: true
  has_many :answers, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :randomize_and_limit_questions_per_category, ->(q) { order("RANDOM()").limit(q.questions_per_category) }

  delegate :questions_per_category, to: :question_category
  default_scope { order(created_at: :asc) } # oldest_first

  accepts_nested_attributes_for :answers, allow_destroy: true

  def correct_answers_count
    answers.select(&:correct?).count
  end

  def radio?
    answers.one?(&:correct)
  end
end
