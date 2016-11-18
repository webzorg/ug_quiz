class TranslateProfessors < ActiveRecord::Migration[5.0]
  def self.up
    Professor.create_translation_table!(
      {
        name: :string
      },
      migrate_data: true,
      remove_source_columns: true
    )
  end

  def self.down
    Professor.drop_translation_table! migrate_data: true
  end
end
