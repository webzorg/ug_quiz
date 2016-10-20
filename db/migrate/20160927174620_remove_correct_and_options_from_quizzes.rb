class RemoveCorrectAndOptionsFromQuizzes < ActiveRecord::Migration[5.0]
  def change
    remove_columns :answers, :correct, :options
  end
end
