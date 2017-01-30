class ChangeExpiresAtTimestampToUtc < ActiveRecord::Migration[5.0]
  def change
    change_column :quizzes, :expires_at, "timestamp without time zone"
  end
end
