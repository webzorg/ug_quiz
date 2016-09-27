class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :options
      t.boolean :correct
      t.references :question
      t.references :student

      t.timestamps
    end
  end
end
