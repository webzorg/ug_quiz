class RemoveWeightFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :weight
  end
end
