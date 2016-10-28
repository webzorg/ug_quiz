class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :question
      t.references :student
      t.references :answer
      t.timestamps
    end
  end
end
