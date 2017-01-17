class ReAddQuestionAndQuestionIdReferenceToQuestionPermutation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :question_permutations, :question_id
    remove_reference :question_permutations, :question_category_id
    add_reference :question_permutations, :question, index: true
    add_reference :question_permutations, :question_category, index: true
  end
end
