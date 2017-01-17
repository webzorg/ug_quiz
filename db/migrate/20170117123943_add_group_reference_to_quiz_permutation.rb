class AddGroupReferenceToQuizPermutation < ActiveRecord::Migration[5.0]
  def change
    add_reference :quiz_permutations, :group, index: true
  end
end
