class Quiz < ApplicationRecord
  belongs_to :group, counter_cache: true
  has_many :questions, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
