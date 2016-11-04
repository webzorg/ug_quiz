class RemoveGroupIdFromQuizzes < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :group_id
  end
end
