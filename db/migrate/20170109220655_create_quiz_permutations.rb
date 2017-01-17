class CreateQuizPermutations < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_permutations do |t|
      t.text :questions, array: true, default: []
      t.references :quiz
      t.timestamps
    end
  end
end
