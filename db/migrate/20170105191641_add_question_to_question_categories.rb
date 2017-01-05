class AddQuestionToQuestionCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :question_category, index: true, foreign_key: true
  end
end
