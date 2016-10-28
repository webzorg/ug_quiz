class CreateGroupsQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_quizzes do |t|
      t.references :quiz, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
