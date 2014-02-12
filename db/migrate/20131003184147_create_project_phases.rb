class CreateProjectPhases < ActiveRecord::Migration
  def change
    create_table :project_phases do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.string :deliverable_type

      t.timestamps
    end
  end
end
