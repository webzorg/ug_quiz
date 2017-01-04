class AddQuestionsPerQuizToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :questions_per_quizzes, :integer
  end
end
