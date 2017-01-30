class AddQuizTimeoutTimeToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :expires_at, :time
  end
end
