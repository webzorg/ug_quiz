class AddContentToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :content, :text
  end
end
