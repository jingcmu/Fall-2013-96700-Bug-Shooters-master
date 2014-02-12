class CreateLifecyclePhases < ActiveRecord::Migration
  def change
    create_table :lifecycle_phases do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
