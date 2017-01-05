class AddCatWeightToQuestionCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :question_categories, :category_weight, :float, default: 1.0
  end
end
