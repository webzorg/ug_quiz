class CreateAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :attempts do |t|
      t.references :quiz, foreign_key: true
      t.references :student, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
