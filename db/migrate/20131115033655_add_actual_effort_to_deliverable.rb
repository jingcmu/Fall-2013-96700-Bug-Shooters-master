class AddActualEffortToDeliverable < ActiveRecord::Migration
  def change
      add_column :deliverables, :actual_effort, :float
  end
end
