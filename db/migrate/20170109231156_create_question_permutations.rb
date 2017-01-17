class CreateQuestionPermutations < ActiveRecord::Migration[5.0]
  def change
    create_table :question_permutations do |t|
      t.text :questions, array: true, default: []
      t.references :quiz_permutation
      t.timestamps
    end
  end
end
