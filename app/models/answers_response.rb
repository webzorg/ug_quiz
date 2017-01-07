# == Schema Information
#
# Table name: answers_responses
#
#  id          :integer          not null, primary key
#  answer_id   :integer
#  response_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswersResponse < ApplicationRecord
  belongs_to :answer
  belongs_to :response
end
