class RemoveLifecycleTypeFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :lifecycle_type, :string
  end

  def down
    remove_column :projects, :lifecycle_type, :string
  end
end
