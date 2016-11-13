class Attempt < ApplicationRecord
  belongs_to :quiz
  belongs_to :student
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses
end
