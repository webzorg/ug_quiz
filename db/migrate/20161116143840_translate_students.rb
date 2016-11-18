class TranslateStudents < ActiveRecord::Migration[5.0]
  def self.up
    Student.create_translation_table!(
      {
        name: :string
      },
      migrate_data: true,
      remove_source_columns: true
    )
  end

  def self.down
    Student.drop_translation_table! migrate_data: true
  end
end
