class AddTotalWeightToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :total_weight, :float, default: 0
  end
end
