class AddCorrectToResponses < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :correct, :boolean
  end
end
