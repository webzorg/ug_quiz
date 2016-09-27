class ChangeProfessorIdToGroupIdInQuizzes < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :professor_id
    add_column :quizzes, :group_id, :integer
  end
end
