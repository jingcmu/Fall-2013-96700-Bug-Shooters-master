class AddLifecycleIdtoProjects < ActiveRecord::Migration

    def change
      add_column :projects, :lifecycle_id, :integer
    end
  end



