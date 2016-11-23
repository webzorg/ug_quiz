class AddGroupToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :group, foreign_key: true
  end
end
