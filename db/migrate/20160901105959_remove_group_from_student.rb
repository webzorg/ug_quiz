class RemoveGroupFromStudent < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :group_id
  end
end
