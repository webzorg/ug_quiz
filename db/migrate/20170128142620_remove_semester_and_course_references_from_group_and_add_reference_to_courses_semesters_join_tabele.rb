class RemoveSemesterAndCourseReferencesFromGroupAndAddReferenceToCoursesSemestersJoinTabele < ActiveRecord::Migration[5.0]
  def change
    remove_reference :groups, :semester
    remove_reference :groups, :course
    add_reference :groups, :courses_semester, foreign_key: true
  end
end
