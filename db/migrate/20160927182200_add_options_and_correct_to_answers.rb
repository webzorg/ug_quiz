class AddOptionsAndCorrectToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :options, :text, array: true, default: []
    add_column :answers, :correct, :text, array: true, default: []
  end
end
