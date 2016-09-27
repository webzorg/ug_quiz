class AddDefaultValueToProfessorsAdminAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :professors, :admin, :boolean, default: false
  end
end
