class AddProfessorToGroup < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :professor, foreign_key: true
  end
end
