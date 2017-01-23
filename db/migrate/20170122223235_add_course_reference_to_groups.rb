class AddCourseReferenceToGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :course, index: true
  end
end
