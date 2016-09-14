class RemoveStudentFromGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :student_id
  end
end
