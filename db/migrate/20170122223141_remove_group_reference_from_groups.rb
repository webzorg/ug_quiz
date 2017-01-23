class RemoveGroupReferenceFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_reference :groups, :group
  end
end
