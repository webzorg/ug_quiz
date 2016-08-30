class AddFieldsToProfessors < ActiveRecord::Migration[5.0]
  def change
    add_column :professors, :name, :string
  end
end
