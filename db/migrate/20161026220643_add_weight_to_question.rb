class AddWeightToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :weight, :float
  end
end
