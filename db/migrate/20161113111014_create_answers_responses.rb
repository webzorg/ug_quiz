class CreateAnswersResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :answers_responses do |t|
      t.references :answer, foreign_key: true
      t.references :response, foreign_key: true

      t.timestamps
    end
  end
end
