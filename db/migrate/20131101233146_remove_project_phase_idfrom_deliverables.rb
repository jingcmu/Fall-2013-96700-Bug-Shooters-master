class RemoveProjectPhaseIdfromDeliverables < ActiveRecord::Migration
  def up
    remove_column :deliverables, :project_phase_id, :integer
  end

  def down
  end
end
