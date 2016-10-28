class RenameStudentIdToAttempIdInResponse < ActiveRecord::Migration[5.0]
  def change
    rename_column :responses, :student_id, :attempt_id
  end
end
