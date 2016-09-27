class RemoveQuizzesCountFromProfessors < ActiveRecord::Migration[5.0]
  def change
    remove_column :professors, :quizzes_count
  end
end
