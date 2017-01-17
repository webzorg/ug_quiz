class AddStudentReferenceToQuestionPermutation < ActiveRecord::Migration[5.0]
  def change
    add_reference :question_permutations, :student, index: true
  end
end
