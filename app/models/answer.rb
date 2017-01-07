# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  correct     :boolean
#

class Answer < ApplicationRecord
  translates :content, fallbacks_for_empty_translations: true

  belongs_to :question, optional: true
  has_many :answers_responses, dependent: :destroy
  has_many :responses, through: :answers_responses, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
end
