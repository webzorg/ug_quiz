class AddUniqueIndexToQuizIdInQuizPermutations < ActiveRecord::Migration[5.0]
  def change
    remove_index :quiz_permutations, :quiz_id
    add_index :quiz_permutations, :quiz_id, unique: true
  end
end
