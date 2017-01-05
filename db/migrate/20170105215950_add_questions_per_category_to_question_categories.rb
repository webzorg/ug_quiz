class AddQuestionsPerCategoryToQuestionCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :question_categories, :questions_per_category, :integer
  end
end
