class CreateGroupsStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_students do |t|
      t.references :student, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
