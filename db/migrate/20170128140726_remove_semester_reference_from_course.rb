class RemoveSemesterReferenceFromCourse < ActiveRecord::Migration[5.0]
  def change
    remove_reference :courses, :semester
  end
end
