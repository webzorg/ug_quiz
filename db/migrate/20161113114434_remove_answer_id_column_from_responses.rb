class RemoveAnswerIdColumnFromResponses < ActiveRecord::Migration[5.0]
  def change
    remove_column :responses, :answer_id
  end
end
