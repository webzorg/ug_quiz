class RemoveQuestionsArrayFromQuizPermutations < ActiveRecord::Migration[5.0]
  def change
    remove_column :quiz_permutations, :questions, :text, array: true, default: []
  end
end
