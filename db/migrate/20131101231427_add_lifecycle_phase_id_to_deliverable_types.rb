class AddLifecyclePhaseIdToDeliverableTypes < ActiveRecord::Migration
  def change
    add_column :deliverable_types, :lifecycle_phase_id, :integer
  end
end
