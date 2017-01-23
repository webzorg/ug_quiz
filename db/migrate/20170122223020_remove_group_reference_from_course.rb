class RemoveGroupReferenceFromCourse < ActiveRecord::Migration[5.0]
  def change
    remove_reference :courses, :group
  end
end
