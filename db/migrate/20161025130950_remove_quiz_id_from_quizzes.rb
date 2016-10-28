class RemoveQuizIdFromQuizzes < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :quiz_id
  end
end
