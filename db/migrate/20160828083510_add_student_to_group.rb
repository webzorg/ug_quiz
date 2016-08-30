class AddStudentToGroup < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :student, foreign_key: true
  end
end
