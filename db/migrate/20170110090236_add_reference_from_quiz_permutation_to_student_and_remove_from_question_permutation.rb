class AddReferenceFromQuizPermutationToStudentAndRemoveFromQuestionPermutation < ActiveRecord::Migration[5.0]
  def change
    add_reference :quiz_permutations, :student, index:true, foreign_key: true
    remove_reference :question_permutations, :student
  end
end
