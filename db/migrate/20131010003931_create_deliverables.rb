class CreateDeliverables < ActiveRecord::Migration
  def up
      # drop_table :deliverables
      create_table :deliverables do |t|
      t.string :name
      t.text :description
      t.integer :project_phase_id
      t.integer :deliverable_type_id

      t.timestamps
    end
  end

  def down
    # drop_table :deliverables
  end
end
