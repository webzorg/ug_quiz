class AddAdminToProfessors < ActiveRecord::Migration[5.0]
  def change
    add_column :professors, :admin, :boolean
  end
end
