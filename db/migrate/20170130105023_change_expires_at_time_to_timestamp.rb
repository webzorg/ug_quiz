class ChangeExpiresAtTimeToTimestamp < ActiveRecord::Migration[5.0]
  def change
    change_column :quizzes, :expires_at, "datetime without time zone"
  end
end
