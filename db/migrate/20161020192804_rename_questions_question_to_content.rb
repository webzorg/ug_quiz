class RenameQuestionsQuestionToContent < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :question, :content
  end
end
