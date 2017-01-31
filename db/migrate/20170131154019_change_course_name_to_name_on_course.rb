class ChangeCourseNameToNameOnCourse < ActiveRecord::Migration[5.0]
  def change
    change_column :course_translations, :course_name, :name
  end
end
