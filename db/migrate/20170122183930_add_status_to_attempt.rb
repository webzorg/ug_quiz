class AddStatusToAttempt < ActiveRecord::Migration[5.0]
  def change
    add_column :attempts, :status, :boolean, default: true
  end
end
