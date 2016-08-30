class CreateSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :semesters do |t|
      t.integer :year, limit: 4
      t.boolean :academicterm

      t.timestamps
    end
  end
end
