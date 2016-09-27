class AddQuizzesCountToProfessors2 < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :quizzes_count, :integer, default: 0, null: false
    remove_column :quizzes, :quizzes_count
  end
end
