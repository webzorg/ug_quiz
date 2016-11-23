class RenameCourseIdToCourseCode < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :course_id, :course_code
  end
end
