class AddQuizPermutationReferenceToQuizPermutations < ActiveRecord::Migration[5.0]
  def change
    add_reference :attempts, :quiz_permutation, index:true, foreign_key: true
  end
end
