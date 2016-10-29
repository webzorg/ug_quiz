class AddDefaultValueToQuestionWeight < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :weight, :float, default: 1
  end
end
