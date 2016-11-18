class TranslateAnswers < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Answer.create_translation_table!(
          {
            content: :string
          },
          migrate_data: true,
          remove_source_columns: true
        )
      end

      dir.down do
        Answer.drop_translation_table! migrate_data: true
      end
    end
  end
end
