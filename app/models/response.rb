class Response < ApplicationRecord
  belongs_to :attempt
  belongs_to :answer
  belongs_to :question
end
