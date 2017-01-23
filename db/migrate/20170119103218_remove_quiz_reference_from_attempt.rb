class RemoveQuizReferenceFromAttempt < ActiveRecord::Migration[5.0]
  def change
    remove_reference :attempts, :quiz
  end
end
