class ChangeStatusToCompletedInAttempts < ActiveRecord::Migration[5.0]
  def change
    change_column :attempts, :status, :boolean, default: false
    rename_column :attempts, :status, :completed
  end
end
