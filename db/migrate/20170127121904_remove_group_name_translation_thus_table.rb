class RemoveGroupNameTranslationThusTable < ActiveRecord::Migration[5.0]
  def change
    Group.drop_translation_table! migrate_data: false
  end
end
