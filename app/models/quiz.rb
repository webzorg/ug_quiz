class Quiz < ApplicationRecord
  belongs_to :group, counter_cache: true
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :answers, allow_destroy: true
end
