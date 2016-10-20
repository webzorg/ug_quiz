class RemoveOptionsAndCorrectFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :options, :text, array: true, default: []
    remove_column :answers, :correct, :text, array: true, default: []
  end
end
