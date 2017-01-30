class AddExpiresAtTimestampToQuiz2 < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :expires_at, "timestamp with time zone"
  end
end
