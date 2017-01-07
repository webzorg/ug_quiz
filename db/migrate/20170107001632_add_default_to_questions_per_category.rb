class AddDefaultToQuestionsPerCategory < ActiveRecord::Migration[5.0]
  def change
    change_column :question_categories, :questions_per_category, :integer, default: 1
  end
end
