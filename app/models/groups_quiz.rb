# == Schema Information
#
# Table name: groups_quizzes
#
#  id         :integer          not null, primary key
#  quiz_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupsQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :group
end
