class CreateAdhocDeliverables < ActiveRecord::Migration
  def change
    create_table :adhoc_deliverables do |t|
      t.string :name
      t.text :description
      t.integer :project_phase_id
      t.string :complexity
      t.string :unit_of_measure
      t.integer :estimated_size
      t.integer :estimated_production_rate
      t.integer :estimated_effort

      t.timestamps
    end
  end
end
