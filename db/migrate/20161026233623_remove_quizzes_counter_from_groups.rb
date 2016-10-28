class RemoveQuizzesCounterFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :quizzes_count
  end
end
