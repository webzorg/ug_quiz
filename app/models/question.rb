class Question < ApplicationRecord
  belongs_to :quiz, optional: true
  has_one :answer, dependent: :destroy
end
