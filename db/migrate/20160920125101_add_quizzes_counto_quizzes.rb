class AddQuizzesCountoQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :quizzes_count, :integer
  end
end
