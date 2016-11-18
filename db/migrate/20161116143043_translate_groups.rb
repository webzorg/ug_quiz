class TranslateGroups < ActiveRecord::Migration[5.0]
  def self.up
    Group.create_translation_table!(
      {
        name: :string
      },
      migrate_data: true,
      remove_source_columns: true
    )
  end

  def self.down
    Group.drop_translation_table! migrate_data: true
  end
end
