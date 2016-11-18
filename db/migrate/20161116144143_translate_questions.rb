class TranslateQuestions < ActiveRecord::Migration[5.0]
  def self.up
    Question.create_translation_table!(
      {
        content: :string
      },
      migrate_data: true,
      remove_source_columns: true
    )
  end

  def self.down
    Question.drop_translation_table! migrate_data: true
  end
end
