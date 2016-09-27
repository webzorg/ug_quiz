class AddQuizNumberToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :quiz_id, :integer
  end
end
