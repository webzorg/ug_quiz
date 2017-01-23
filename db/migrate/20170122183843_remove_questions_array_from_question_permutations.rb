class RemoveQuestionsArrayFromQuestionPermutations < ActiveRecord::Migration[5.0]
  def change
    remove_column :question_permutations, :questions, :text, array: true, default: []
  end
end
