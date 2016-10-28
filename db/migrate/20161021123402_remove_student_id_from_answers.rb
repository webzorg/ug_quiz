class RemoveStudentIdFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :student_id
  end
end
