class RemoveQuestionsPerQuizFromQuiz < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :questions_per_quizzes
  end
end
