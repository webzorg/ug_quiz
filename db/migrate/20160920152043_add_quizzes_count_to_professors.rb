class AddQuizzesCountToProfessors < ActiveRecord::Migration[5.0]
  def change
    add_column :professors, :quizzes_count, :integer
  end
end
