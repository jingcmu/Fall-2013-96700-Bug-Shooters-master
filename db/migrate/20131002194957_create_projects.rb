class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :lifecycle_type
      t.string :project_phase

      t.timestamps
    end
  end
end
