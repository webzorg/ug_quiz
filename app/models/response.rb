class Response < ApplicationRecord
  belongs_to :attempt
  belongs_to :question

  has_many :answers_responses
  has_many :answers, through: :answers_responses
end
