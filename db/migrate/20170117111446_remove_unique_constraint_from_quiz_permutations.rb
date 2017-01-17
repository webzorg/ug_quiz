class RemoveUniqueConstraintFromQuizPermutations < ActiveRecord::Migration[5.0]
  def change
    remove_index :quiz_permutations, [:quiz_id, :student_id]
    add_index :quiz_permutations, :quiz_id
  end
end
