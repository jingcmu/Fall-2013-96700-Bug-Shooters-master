class RemoveProjectPhasefromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :project_phase, :string
  end

  def down
  end
end
