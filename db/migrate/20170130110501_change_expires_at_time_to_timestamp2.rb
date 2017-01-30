class ChangeExpiresAtTimeToTimestamp2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :expires_at
  end
end
