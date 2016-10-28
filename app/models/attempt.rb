class Attempt < ApplicationRecord
  belongs_to :quiz
  belongs_to :student
  has_many :responses, dependent: :destroy
end
