class RenameCategoryWeightToWeight < ActiveRecord::Migration[5.0]
  def change
    rename_column :question_categories, :category_weight, :weight
  end
end
