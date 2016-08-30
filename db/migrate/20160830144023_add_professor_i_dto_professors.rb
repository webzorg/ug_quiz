class AddProfessorIDtoProfessors < ActiveRecord::Migration[5.0]
  def change
    add_column :professors, :professor_id, :integer
  end
end
