class ChangeCourseNameToNameOnCourse2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :course_name
  end
end
