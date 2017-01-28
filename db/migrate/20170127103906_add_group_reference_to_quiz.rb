class AddGroupReferenceToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_reference :quizzes, :group, foreign_key: true
  end
end
