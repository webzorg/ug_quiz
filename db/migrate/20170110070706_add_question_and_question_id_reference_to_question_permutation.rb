class AddQuestionAndQuestionIdReferenceToQuestionPermutation < ActiveRecord::Migration[5.0]
  def change
    add_reference :question_permutations, :question_id, index: true
    add_reference :question_permutations, :question_category_id, index: true
  end
end
