class AddActiveToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :active, :boolean
  end
end
