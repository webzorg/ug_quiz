class GroupsQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :group
end
