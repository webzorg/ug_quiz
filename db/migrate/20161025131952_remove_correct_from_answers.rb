class RemoveCorrectFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :correct
  end
end
